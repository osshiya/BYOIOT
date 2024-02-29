import SwiftUI

class ComponentModel: ObservableObject {
    @Published var items = [ListItem]()
    
    init() {
        items.append(contentsOf: ListItem.items)
    }
}

class ResultModel: ObservableObject {
    @Published var items = [ListBuild]()
    
    init() {
        items.append(contentsOf: ListBuild.items)
    }
}

class SharedViewModel: ObservableObject {
    @Published var items: Set<[String]> = Set()
    @Published var item: String = ""
    @Published var itemDesc: String = ""
    
    @Published var viewIndexes: [Bool] = []
    
    @Published var nodePosition: [CGPoint] = []
    @Published var linePosition: [CGPoint] = []
    @Published var lineOffset: [CGSize] = []
    @Published var sensorPosition: [CGPoint] = []
    @Published var dragOffset: [CGSize] = []
    
    func addItem (_ newItem: [String]) {
        items.insert(newItem)
    }
    
    func displayItems () {
        viewIndexes = Array(repeating: false, count: items.count)
    }
    
    func displayItemDetails () {
        nodePosition = Array(repeating: .zero, count: items.count)
        linePosition = Array(repeating: .zero , count: items.count)
        lineOffset = Array(repeating: .zero, count: items.count)
        sensorPosition = Array(repeating: .zero, count: items.count)
        dragOffset = Array(repeating: .zero, count: items.count)
    }
}
