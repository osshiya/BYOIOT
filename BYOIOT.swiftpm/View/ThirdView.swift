import SwiftUI

struct ThirdView: View {
    @StateObject private var viewModel = SharedViewModel()
    
    var body: some View {
        ViewThatFits{
            HStack {
                ItemView()
                   .frame(width: UIScreen.main.bounds.width / 2.5)
                DragView()
                    .frame(maxWidth: .infinity)
            }  
            .environmentObject(viewModel)
            
            VStack {
                ItemView()
                    .frame(height: UIScreen.main.bounds.height / 3)
                DragView()
                    .frame(maxHeight: .infinity)
            }  
            .environmentObject(viewModel)
        }
    }
}

struct ItemView: View {
    @StateObject private var Collection = ComponentModel()
    @State private var tabSelected = 0
    
    var body: some View {
        VStack {
            Picker("Picker", selection: $tabSelected) {
                Text("Actuators").tag(0)
                Text("Sensors").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            TabView(selection: $tabSelected) {
                List {
                    ForEach(Collection.items) { item in
                        if (item.type == "A") {
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text(item.desc)
                                    .font(.caption)
                                Image(systemName: item.iconName)
                            }
                            .draggable(item)
                        }
                    }
                }
                .tag(0)
                
                List {
                    ForEach(Collection.items) { item in
                        if (item.type == "S") {
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text(item.desc)
                                    .font(.caption)
                                Image(systemName: item.iconName)
                            }
                            .draggable(item)
                        }
                    }
                }
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct DragView: View {
    @State private var sensorPosition: CGPoint = .zero
    @State private var sensorBeingDragged: Bool = false
    @State private var showBuildSheet: Bool = false
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Build your own IoT by attaching sensors and/or actuators to the Microcontroller board.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("To get started, drag the LED to one of the slot below and build it.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            MicrocontrollerView()
                .padding(.vertical)
            
            SensorView(showBuildSheet: $showBuildSheet)
            
            Text("\(viewModel.items.count.description)/\(ListBuild.items.count.description) unlocked")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding()
            
            Spacer()
            
            if !viewModel.items.isEmpty {
                Text("Move on to the next section")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: ForthView().environmentObject(viewModel)) {
                    CircularNextButton()
                }
            }
            
            Spacer()
        }
        .sheet(isPresented: $showBuildSheet) {
            BuildView(showBuildSheet: $showBuildSheet).environmentObject(viewModel)
        }
    }
}

struct BuildView: View {
    @Binding var showBuildSheet: Bool
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            if (!viewModel.item.isEmpty) {
                Text("You've built an")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                + Text(" IoT")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                
                Spacer()
                
                Text(viewModel.item)
                    .font(.title)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                
                Text(viewModel.itemDesc)
                    .font(.subheadline)
                
            } else {
                Text("Try a different combination")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Button("Close") {
                showBuildSheet.toggle()
            }
            
            Spacer()
        }
    }
}
