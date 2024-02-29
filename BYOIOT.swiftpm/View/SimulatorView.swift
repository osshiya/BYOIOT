import SwiftUI

struct MicrocontrollerView: View {
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        HStack{
            Image("Board")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
    }
}

struct SensorView: View {
    @Binding var showBuildSheet: Bool
    
    @State private var component1 = "questionmark.app.dashed"
    @State private var component2 = "questionmark.app.dashed"
    @State private var component3 = "questionmark.app.dashed"
    
    @State private var textComponent1 = "Drop here"
    @State private var textComponent2 = "Drop here"
    @State private var textComponent3 = "Drop here"
    
    @State private var componentStatus1 = false
    @State private var componentStatus2 = false
    @State private var componentStatus3 = false
    
    @State private var borderColor1 = Color(.gray.opacity(0.5))
    @State private var borderWidth1 = CGFloat(1)
    @State private var borderColor2 = Color(.gray.opacity(0.5))
    @State private var borderWidth2 = CGFloat(1)
    @State private var borderColor3 = Color(.gray.opacity(0.5))
    @State private var borderWidth3 = CGFloat(1)
    
    @State private var slots = [String](repeating: "", count: 3)

    @StateObject private var Collection = ResultModel()
    @EnvironmentObject var viewModel: SharedViewModel
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: componentStatus1 ? component1 : "questionmark.app.dashed")
                    .frame(width: 80, height: 80)
                    .background(.gray.opacity(0.1))
                    .foregroundStyle(componentStatus1 ? Color(.blue.opacity(1)) : Color(.gray.opacity(1)))
                    .border(borderColor1, width: borderWidth1)
                    .dropDestination(for: ListItem.self) {
                        items, location in
                        component1 = items.first!.iconName
                        textComponent1 = items.first!.name
                        borderColor1 = .blue
                        componentStatus1 = true
                        slots[0] = items.first!.name
                        return true
                    } isTargeted: { inDropArea in
                        borderColor1 = inDropArea ? .red : .gray.opacity(0.5)
                        borderWidth1 = inDropArea ? 5.0 : 1.0
                    }
                    .padding(.horizontal)
                Text(componentStatus1 ? textComponent1 : "Drop here")
                    .foregroundColor(componentStatus1 ? .blue : .gray.opacity(1))
            }
            
            VStack {
                Image(systemName: componentStatus2 ? component2 : "questionmark.app.dashed")
                    .frame(width: 80, height: 80)
                    .background(.gray.opacity(0.1))
                    .foregroundStyle(componentStatus2 ? Color(.blue.opacity(1)) : Color(.gray.opacity(1)))
                    .border(borderColor2, width: borderWidth2)
                    .dropDestination(for: ListItem.self) {
                        items, location in
                        component2 = items.first!.iconName
                        textComponent2 = items.first!.name
                        borderColor2 = .blue
                        componentStatus2 = true
                        slots[1] = items.first!.name
                        return true
                    } isTargeted: { inDropArea in
                        borderColor2 = inDropArea ? .red : .gray.opacity(0.5)
                        borderWidth2 = inDropArea ? 5.0 : 1.0
                    }
                    .padding(.horizontal)
                Text(componentStatus2 ? textComponent2 : "Drop here")
                    .foregroundColor(componentStatus2 ? .blue : .gray.opacity(1))
            }
            
            VStack {
                Image(systemName: componentStatus3 ? component3 : "questionmark.app.dashed")
                    .frame(width: 80, height: 80)
                    .background(.gray.opacity(0.1))
                    .foregroundStyle(componentStatus3 ? Color(.blue.opacity(1)) : Color(.gray.opacity(1)))
                    .border(borderColor3, width: borderWidth3)
                    .dropDestination(for: ListItem.self) {
                        items, location in
                        component3 = items.first!.iconName
                        textComponent3 = items.first!.name
                        borderColor3 = .blue
                        componentStatus3 = true
                        slots[2] = items.first!.name
                        return true
                    } isTargeted: { inDropArea in
                        borderColor3 = inDropArea ? .red : .gray.opacity(0.5)
                        borderWidth3 = inDropArea ? 5.0 : 1.0
                    }
                    .padding(.horizontal)
                Text(componentStatus3 ? textComponent3 : "Drop here")
                    .foregroundColor(componentStatus3 ? .blue : .gray.opacity(1))
            }
        }
        
            Button ("Build") {
                slots.sort()
                for list in Collection.items {
                    var found = true
                    if !list.combination.contains(slots) {
                        found = false
                        viewModel.item = ""
                    }
                    if found {
                        print("Building: \(list.name)")
                        viewModel.addItem([list.name, list.iconName])
                        viewModel.item = list.name
                        viewModel.itemDesc = list.desc
                        viewModel.displayItems()
                        viewModel.displayItemDetails()
                        break
                    }
                }
                clear()
                
                showBuildSheet.toggle()
            }
            .padding()
    }
    
    func clear () {
        componentStatus1 = false
        componentStatus2 = false
        componentStatus3 = false
        
        borderColor1 = Color(.gray.opacity(0.5))
        borderColor2 = Color(.gray.opacity(0.5))
        borderColor3 = Color(.gray.opacity(0.5))

        slots = Array(repeating: "", count: slots.count)
    }
}
