import SwiftUI

struct ForthView: View {
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        ViewThatFits{
            HStack {
                ControlView()
                ResultView()
            }
            .environmentObject(viewModel)
            
            VStack {
                ControlView()
                ResultView()
            }  
            .environmentObject(viewModel)
        }
    }
}

struct ControlView: View {
    @EnvironmentObject var viewModel: SharedViewModel
    @State private var tabSelected = 1
    
    var body: some View {
        VStack {
            Text("\(viewModel.items.count.description)/\(ListBuild.items.count.description) unlocked")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            ScrollView {
                LazyVGrid (
                    columns: [GridItem(.flexible()), GridItem(.flexible())], 
                    spacing: 16) {
                        ForEach(Array(viewModel.items.enumerated()), id: \.element) { index, item in
                            HStack {
                                Button(action: {
                                    viewModel.viewIndexes[index] = !viewModel.viewIndexes[index]
                                }) {
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Circle()
                                                .fill(viewModel.viewIndexes[index] ? .green : .red)
                                                .stroke(Color.black.opacity(0.3), lineWidth: 2)
                                                .frame(width: 10, height: 10)
                                                .padding(.leading, 10)
                                            Spacer()
                                        }
                                        Image(systemName: item[1])
                                        Text(item[0])
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                            .padding(10)
                                        Spacer()
                                    }
                                    .background(
                                        RoundedRectangle (cornerRadius: 15)
                                            .stroke(Color.black.opacity(0.3), lineWidth: 2)
                                            .fill(Color.white)
                                    )
                                }
                            }
                        }
                    }
                    .padding()
            }
        }
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: SharedViewModel
    @GestureState private var dragOffset: CGSize = .zero
    @State private var circlePoint: CGPoint = .zero
    
    var body: some View {
        GeometryReader { geometry in 
            VStack {
                ZStack {
                    Text("IoT devices, unlike normal devices, connect to the internet, they collect data via sensors and enable remote control. \n\nIn this setup, you can control an IoT via the remote dashboard on the left side without manually triggering a physical switch. \n\nOn the right side, drag and move the different IoT objects and observe how they stay connected to the central communication point where exchanging of data happens.")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .offset(x: 0, y: -200)
                    
                    let counts: Int = viewModel.items.count
                    
                    ForEach(Array(viewModel.items.enumerated()), id: \.element) { index, item in
                        // Draw the line between the circles
                        Path { path in
                            path.move(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height/2 - 30))
                            
                            path.addLine(to: CGPoint(x: geometry.size.width/2 + viewModel.linePosition[index].x + viewModel.lineOffset[index].width, y: geometry.size.height/2 + viewModel.linePosition[index].y + viewModel.lineOffset[index].height))
                        }
                        .stroke(Color.cyan, style: StrokeStyle(lineWidth: 2, dash: [2]))
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: item[1])
                                    .foregroundColor(viewModel.viewIndexes[index] ? .white : .black)
                                    .symbolEffect(.scale.up, isActive: viewModel.viewIndexes[index])
                            )
                            .offset(x: viewModel.sensorPosition[index].x + viewModel.lineOffset[index].width, y: viewModel.sensorPosition[index].y + viewModel.lineOffset[index].height + 100)
                            .environmentObject(viewModel)
                            .onAppear {
                                if (index >= (counts/2)) {
                                    if (index == Int(counts/2)) {
                                        circlePoint = CGPoint(x: 0, y: -180)
                                    }else {
                                        circlePoint = CGPoint(x: (-80/(index - Int(counts/2))), y: (-95/(index - Int(counts/2))))
                                    }
                                } else {
                                    if (index == 0) {
                                        circlePoint = .zero
                                    } else {
                                        circlePoint = CGPoint(x: (120 - (80/(index + 1))), y: (-155 + (120/(index + 1))))
                                    }
                                }
                                
                                viewModel.sensorPosition[index] = CGPoint(x: circlePoint.x, y: circlePoint.y)
                                viewModel.linePosition[index] = CGPoint(x: circlePoint.x, y: circlePoint.y + 60)
                            }
                            .gesture(
                                DragGesture()
                                    .updating($dragOffset, body: { (value, state, _) in
                                        state = value.translation
                                    })
                                    .onChanged { value in
                                        viewModel.lineOffset[index] = CGSize(width: dragOffset.width, height: dragOffset.height)
                                    }
                                    .onEnded { value in
                                        viewModel.sensorPosition[index].x +=
                                        viewModel.lineOffset[index].width
                                        viewModel.sensorPosition[index].y += 
                                        viewModel.lineOffset[index].height
                                        
                                        viewModel.linePosition[index].x += viewModel.lineOffset[index].width
                                        viewModel.linePosition[index].y += viewModel.lineOffset[index].height
                                        viewModel.lineOffset[index] = .zero
                                    }
                            )
                    }
                    
                    CentralNodeView()
                        .offset(x: 0, y: 0)
                }
                
                NavigationLink(destination:
                                FirstView().navigationBarBackButtonHidden()) {
                    CircularHomeButton()
                }
                
                Spacer()
            }
        }
    }
}

struct CentralNodeView: View {
    var body: some View {
        // Target Circle
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
            Image(systemName: "wifi")
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .symbolEffect(.variableColor, isActive: true)
        }
    }
}
