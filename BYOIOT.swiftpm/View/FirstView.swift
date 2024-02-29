import SwiftUI

struct FirstView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("What is")
                .font(.largeTitle)
                .foregroundStyle(.black)
            + Text(" IoT")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            Spacer()
            
            Image("IoT").resizable().aspectRatio(contentMode: .fit)
                .frame(height: 300)
            
            VStack(alignment: .leading) {
                Text("IoT, or the Internet of Things, is a technology that connects everyday objects to the internet, enabling them to communicate and exchange useful data. In simpler terms, IoT makes regular things smart by connecting them to the internet.")
                    .padding()
                
                Text("IoT offers infinite possibilities for innovation and automation. With IoT devices, you can remotely monitor and control your environment across various domains such as home, healthcare, agriculture, and beyond.")
                    .padding()
            }
            
            Spacer()
            
            NavigationLink(destination: SecondView().navigationBarBackButtonHidden()) {
                CircularNextButton()
            }
            
            Spacer()
        }
        .padding()
    }
}
