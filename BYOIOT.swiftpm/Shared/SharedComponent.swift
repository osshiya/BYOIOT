import SwiftUI
import UniformTypeIdentifiers

struct CircularNextButton: View {
    var body: some View {
        Image(systemName: "arrowtriangle.right.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.blue)
            .background(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(color: .black.opacity(0.4), radius: 1, x: 0, y: 1)
    }
}

struct CircularHomeButton: View {
    var body: some View {
        Image(systemName: "house.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.blue)
            .background(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(color: .black.opacity(0.4), radius: 1, x: 0, y: 1)
    }
}

extension UTType {
    static var item = UTType(exportedAs: "com.example.item")
}
