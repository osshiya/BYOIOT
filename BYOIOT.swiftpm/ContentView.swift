import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        NavigationView{
            FirstView()  
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
