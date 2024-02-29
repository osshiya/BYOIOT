import SwiftUI

struct SecondView: View {
    @State private var content = Text("IoT are built by integrating multiple components such as sensors, actuators, a microcontroller board, and more.")
    @State private var contentStyle1 = false
    @State private var contentStyle2 = false
    @State private var contentStyle3 = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Components of an ")
                .font(.largeTitle)
                .foregroundStyle(.black)
            + Text(" IoT")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            Spacer()
            
            VStack(alignment: .leading) {
                content
            }
            .frame(height: 200)
            .padding()
            
            Spacer()
            
            HStack {
                Button(action: {
                    content = Text("Sensors are devices that detect and measure changes in the physical environment. They capture data such as temperature, humidity, light intensity, motion, and more. Sensors serve as the eyes and ears of our IoT device, providing real-time information about the surrounding environment.")
                    contentStyle1 = true
                    contentStyle2 = false
                    contentStyle3 = false
                }) {
                    VStack {
                        Spacer()
                        Image(systemName: "sensor.tag.radiowaves.forward.fill")
                            .foregroundStyle(contentStyle1 ? .white : .blue)
                        Text("Sensor")
                            .font(.headline)
                            .foregroundStyle(contentStyle1 ? .white : .blue)
                            .padding(10)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 200)
                    .background(
                        RoundedRectangle (cornerRadius: 15)
                            .stroke(Color.black.opacity(0.3), lineWidth: 2)
                            .fill(contentStyle1 ? LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding()
                
                Button(action: {
                    content = Text("Actuators are components responsible for taking action based on the data collected by sensors or commands received from the controller. They convert electrical signals into mechanical motion or other physical actions. Actuators enable our IoT device to interact with and affect the physical world.")
                    contentStyle1 = false
                    contentStyle2 = true
                    contentStyle3 = false
                }) {
                    VStack {
                        Spacer()
                        Image(systemName: "gear")
                            .foregroundStyle(contentStyle2 ? .white : .blue)
                        Text("Actuator")
                            .font(.headline)
                            .foregroundStyle(contentStyle2 ? .white : .blue)
                            .padding(10)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 200)
                    .background(
                        RoundedRectangle (cornerRadius: 15)
                            .stroke(Color.black.opacity(0.3), lineWidth: 2)
                            .fill(contentStyle2 ? LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding()
                
                Button(action: {
                    content = Text("Microcontroller board serves as the brain of our IoT device. It handles data processing, decision-making and communication tasks.")
                    contentStyle1 = false
                    contentStyle2 = false
                    contentStyle3 = true
                }) {
                    VStack {
                        Spacer()
                        Image(systemName: "brain.fill")
                            .foregroundStyle(contentStyle3 ? .white : .blue)
                        Text("Microcontroller")
                            .font(.headline)
                            .foregroundStyle(contentStyle3 ? .white : .blue)
                            .padding(10)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width / 4, height: 200)
                    .background(
                        RoundedRectangle (cornerRadius: 15)
                            .stroke(Color.black.opacity(0.3), lineWidth: 2)
                            .fill(contentStyle3 ? LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.white]), startPoint: .leading, endPoint: .trailing))
                    )
                }
                .padding()
            }
            
            Spacer()
            
            NavigationLink(destination: ThirdView().navigationBarBackButtonHidden()) {
                CircularNextButton()
            }
            
            Spacer()
        }
        .padding()
    }
}
