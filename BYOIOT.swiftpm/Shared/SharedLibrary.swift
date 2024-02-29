import SwiftUI

// Individual components (Sensors and Actuators)
struct ListItem: Identifiable, Codable, Transferable {
    let id = UUID()
    let name: String
    let iconName: String
    let type: String
    let desc: String
    
    static var items: [ListItem] = [
        ListItem(name: "LED", iconName: "lightbulb.fill", type: "A", desc: "Emits light when powered"),
        ListItem(name: "DC Motor", iconName: "gearshape.fill", type: "A", desc: "Converts electrical energy into motion"),
        ListItem(name: "Servo Motor", iconName: "arrow.triangle.2.circlepath.circle.fill", type: "A", desc: "Precisely controls angular position"),
        ListItem(name: "Piezo Buzzer", iconName: "speaker.fill", type: "A", desc: "Produces sound when activated"),
        ListItem(name: "Solenoid", iconName: "waveform.path.ecg", type: "A", desc: "Converts electrical energy into linear motion"),
        ListItem(name: "Pump", iconName: "drop.fill", type: "A", desc: "Moves fluids or gases"),
        ListItem(name: "Speaker", iconName: "speaker.fill", type: "A", desc: "Produces sound from electrical signals"),
        ListItem(name: "Heating Element", iconName: "flame.fill", type: "A", desc: "Generates heat when powered"),
        ListItem(name: "Cooling Fan", iconName: "wind.snow", type: "A", desc: "Dissipates heat when powered"),
        ListItem(name: "LCD Display", iconName: "display", type: "A", desc: "Displays text or graphics"),
        
        ListItem(name: "Light Sensor", iconName: "light.max", type: "S", desc: "Detects ambient light intensity"),
        ListItem(name: "Temperature Sensor", iconName: "thermometer", type: "S", desc: "Measures environmental temperature"),
        ListItem(name: "Humidity Sensor", iconName: "humidity.fill", type: "S", desc: "Measures air moisture level"),
        ListItem(name: "Motion Sensor", iconName: "figure.walk.motion", type: "S", desc: "Detects movement within its range"),
        ListItem(name: "Sound Sensor", iconName: "mic", type: "S", desc: "Detects sound levels or vibrations"),
        ListItem(name: "Distance Sensor", iconName: "loupe", type: "S", desc: "Measures distance to objects"),
        ListItem(name: "Pressure Sensor", iconName: "scalemass.fill", type: "S", desc: "Measures force applied"),
        ListItem(name: "Touch Sensor", iconName: "hand.tap.fill", type: "S", desc: "Detects touch or proximity"),
        ListItem(name: "Image Sensor", iconName: "camera", type: "S", desc: "Captures visual information"),
        ListItem(name: "Gas Sensor", iconName: "cloud.fog", type: "S", desc: "Detects specific gases in air"),
        ListItem(name: "Flame Sensor", iconName: "flame.fill", type: "S", desc: "Detects presence of flames"),
        ListItem(name: "Color Sensor", iconName: "eyedropper.halffull", type: "S", desc: "Detects colors of surfaces"),
        ListItem(name: "Proximity Sensor", iconName: "square.and.arrow.down", type: "S", desc: "Detects nearby objects"),
        ListItem(name: "Water Level Sensor", iconName: "drop", type: "S", desc: "Detects water level"),
        ListItem(name: "Accelerometer", iconName: "speedometer", type: "S", desc: "Measures acceleration forces"),
        ListItem(name: "Gyroscope", iconName: "gyroscope", type: "S", desc: "Measures orientation or rotation"),
        ListItem(name: "Soil Moisture Sensor", iconName: "drop", type: "S", desc: "Measures soil moisture"),
        ListItem(name: "Heart Rate Sensor", iconName: "heart.fill", type: "S", desc: "Measures heartbeats per minute"),
        ListItem(name: "Magnetic Sensor", iconName: "bolt.fill", type: "S", desc: "Detects magnetic fields"),
        ListItem(name: "pH Sensor", iconName: "waveform.path.ecg", type: "S", desc: "Measures acidity or alkalinity"),
        ListItem(name: "Weight Sensor", iconName: "scalemass", type: "S", desc: "Measures applied force")
    ]
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: ListItem.self, contentType: .item)
    }
}

// List of buildable objects
struct ListBuild: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let combination: [String]
    let desc: String
    
    static var items: [ListBuild] = [
        ListBuild(name: "Smart Light Bulb", iconName: "lightbulb.fill", combination: ["", "", "LED"], desc: "Wirelessly controlled light source."),
        ListBuild(name: "Smart Light Bulb with Motion Sensor", iconName: "lightbulb.fill", combination: ["", "LED", "Motion Sensor"], desc: "Light bulb with built-in motion detection."),
        ListBuild(name: "Smart Sound-Sensing Light Bulb", iconName: "lightbulb.fill", combination: ["", "LED", "Sound Sensor"], desc: "Responds to sound with adjustable lighting."),
        ListBuild(name: "Smart Light Bulb with Light Sensor", iconName: "lightbulb.fill", combination: ["", "LED", "Light Sensor"], desc: "Adjusts brightness based on ambient light."),
        ListBuild(name: "Color-changing Mood Light", iconName: "paintpalette.fill", combination: ["", "Color Sensor", "LED"], desc: "Creates ambiance with adjustable colors."),
        
        ListBuild(name: "Smart Thermostat", iconName: "thermometer.sun.fill", combination: ["Humidity Sensor", "LCD Display", "Temperature Sensor"], desc: "Controls indoor climate with precision."),
        ListBuild(name: "Smart Thermostat with Voice Control", iconName: "thermometer.sun.fill", combination: ["Humidity Sensor", "Speaker", "Temperature Sensor"], desc: "Voice-controlled climate management system."),
        
        ListBuild(name: "Intruder Detection System", iconName: "person.fill.badge.exclamationmark", combination: ["Image Sensor", "Motion Sensor", "Speaker"], desc: "Detects and alerts to unauthorized entry."),
        ListBuild(name: "Home Security Camera", iconName: "camera.fill", combination: ["", "Image Sensor", "Motion Sensor"], desc: "Surveillance system for property monitoring."),
        ListBuild(name: "Smart Doorbell with Video", iconName: "video.fill", combination: ["Image Sensor", "Motion Sensor", "Speaker"], desc: "Doorbell with integrated video monitoring."),
        ListBuild(name: "Smart Doorbell with Two-Way Audio", iconName: "waveform.path.ecg.rectangle.fill", combination: ["Image Sensor", "Sound Sensor", "Speaker"], desc: "Allows interactive communication at the door."),
        ListBuild(name: "Smart Door Lock", iconName: "lock.fill", combination: ["", "Proximity Sensor", "Servo Motor"], desc: "Securely locks and unlocks doors."),
        ListBuild(name: "Smart Garage Door Opener", iconName: "garage.fill", combination: ["", "DC Motor", "Proximity Sensor"], desc: "Remote-controlled garage access system."),
        ListBuild(name: "Smart Mailbox", iconName: "envelope.fill", combination: ["", "Image Sensor", "Proximity Sensor"], desc: "Notifies when mail is received."),
        ListBuild(name: "Smart Bike Lock", iconName: "bicycle.circle.fill", combination: ["", "Motion Sensor", "Solenoid"], desc: "Secures bicycles with advanced features."),
        
        ListBuild(name: "Weather Station", iconName: "cloud.sun.fill", combination: ["Humidity Sensor", "LCD Display", "Temperature Sensor"], desc: "Provides accurate weather data."),
        ListBuild(name: "Indoor Air Quality Monitor", iconName: "lungs.fill", combination: ["", "Gas Sensor", "LCD Display"], desc: "Tracks air pollutants for indoor safety."),
        ListBuild(name: "Smart Irrigation System", iconName: "drop.fill", combination: ["Pump", "Soil Moisture Sensor", "Water Level Sensor"], desc: "Optimizes watering based on soil moisture."),
        ListBuild(name: "Soil Moisture-Based Plant Watering System", iconName: "drop.fill", combination: ["", "Pump", "Soil Moisture Sensor"], desc: "Automatically waters plants when needed."),
        ListBuild(name: "Water Quality Monitor", iconName: "drop.fill", combination: ["", "LCD Display", "pH Sensor"], desc: "Ensures water safety with real-time monitoring."),
        ListBuild(name: "Smart Water Dispenser", iconName: "drop.fill", combination: ["", "Pump", "Water Level Sensor"], desc: "Dispenses water accurately and efficiently."),
        
        ListBuild(name: "Smart Gas Alarm", iconName: "flame.fill", combination: ["", "Gas Sensor", "Piezo Buzzer"], desc: "Detects gas leaks and alerts occupants."),
        ListBuild(name: "Smart Fire Alarm", iconName: "flame.fill", combination: ["", "Flame Sensor", "Piezo Buzzer"], desc: "Warns of potential fire hazards."),
        ListBuild(name: "Smart Fire and Gas Alarm", iconName: "flame.fill", combination: ["Flame Sensor", "Gas Sensor", "Piezo Buzzer"], desc: "Combination detector for fire and gas."),
        ListBuild(name: "Gas Stove Safety System", iconName: "flame.fill", combination: ["", "Flame Sensor", "Solenoid"], desc: "Enhances safety by controlling gas flow."),
        
        ListBuild(name: "Automatic Pet Feeder", iconName: "pawprint.fill", combination: ["", "DC Motor", "Weight Sensor"], desc: "Feeds pets on schedule."),
        ListBuild(name: "Automatic Pet Litter Box Cleaner", iconName: "pawprint.fill", combination: ["", "DC Motor", "Weight Sensor"], desc: "Maintains cleanliness automatically."),
        ListBuild(name: "Smart Fish Tank Monitor", iconName: "drop.fill", combination: ["", "pH Sensor", "Water Level Sensor"], desc: "Monitors aquarium conditions for fish health."),
        ListBuild(name: "Automatic Egg Incubator", iconName: "egg.fill", combination: ["Humidity Sensor", "Servo Motor", "Temperature Sensor"], desc: "Hatches eggs with precise environmental control."),
        
        ListBuild(name: "Wearable Fitness Tracker", iconName: "figure.walk.circle.fill", combination: ["", "Heart Rate Sensor", "LCD Display"], desc: "Tracks fitness metrics conveniently."),
        
        ListBuild(name: "Smart Curtains", iconName: "windowblinds.fill", combination: ["", "Light Sensor", "Servo Motor"], desc: "Automates opening and closing."),
        ListBuild(name: "Automatic Window Opener", iconName: "window.open.fill", combination: ["", "Servo Motor", "Temperature Sensor"], desc: "Regulates indoor temperature and ventilation."),
        
        ListBuild(name: "Smart Mirror", iconName: "waveform.path.ecg", combination: ["LCD Display", "Motion Sensor", "Touch Sensor"], desc: "Displays information with interactive features."),
        ListBuild(name: "Smart Kitchen Scale", iconName: "scalemass.fill", combination: ["", "LCD Display", "Weight Sensor"], desc: "Measures ingredients accurately."),
        ListBuild(name: "Smart Bed with Heater", iconName: "bed.double.fill", combination: ["Heating Element", "Pressure Sensor", "Temperature Sensor"], desc: "Adjusts warmth for comfort."),
        ListBuild(name: "Smart Trash Compactor", iconName: "trash.fill", combination: ["", "DC Motor", "Weight Sensor"], desc: "Reduces waste volume intelligently."),
        ListBuild(name: "Smart Umbrella Stand", iconName: "umbrella.fill", combination: ["", "Humidity Sensor", "Motion Sensor"], desc: "Stores and dries umbrellas efficiently."),
        ListBuild(name: "Automatic Faucet", iconName: "drop.fill", combination: ["", "Solenoid", "Touch Sensor"], desc: "Saves water with touchless operation."),
        ListBuild(name: "Smart Laundry Basket", iconName: "cart.fill", combination: ["", "LCD Display", "Weight Sensor"], desc: "Monitors laundry load status."),
        ListBuild(name: "Smart Alarm Clock", iconName: "alarm.fill", combination: ["Light Sensor", "Piezo Buzzer", "Speaker"], desc: "Wakes you up with customizable alarms."),
        ListBuild(name: "Smart Car Parking System", iconName: "car.fill", combination: ["", "Distance Sensor", "Servo Motor"], desc: "Assists in parking with precision."),
        ListBuild(name: "Smart Remote-Controlled Car", iconName: "car.fill.badge.plus", combination: ["", "Accelerometer", "DC Motor"], desc: "Controlled remotely for entertainment or learning purposes.")
    ]
}
