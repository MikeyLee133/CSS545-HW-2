import SwiftUI

// Define a data model for user settings
class UserSettings: ObservableObject {
    @AppStorage("userData") var userData: String = ""
    @AppStorage("userAge") var userAge: String = ""
    @AppStorage("userTask") var userTask: String = ""

}

struct ContentView: View {
    // Inject the UserSettings object into the view
    @ObservedObject var settings: UserSettings = UserSettings()

    // State variable to store the input data
    @State private var inputData: String = ""
    @State private var inputAge: Int = 0

    // State variable to store the loaded data
    @State private var loadedData: String = ""

    var body: some View {
        NavigationView {
            VStack {
                
                Image("UW_Logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                
                // Text field to allow user to input data
                TextField("Enter Data", text: $inputData)
                    .padding()


                // Button to save data
                Button("Save Data") {
                    settings.userData = inputData
                }
                .padding()

                // Button to load data
                Button("Load Data") {
                    loadedData = settings.userData
                }
                .padding()

                // Display saved data
                Text("Saved Data: \(settings.userData)")

                // Display loaded data in a separate text box
                Text("Loaded Data: \(loadedData)")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
