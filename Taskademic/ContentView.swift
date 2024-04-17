import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Image("TaskademiclLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 275, height: 280)
                    .padding(.top, 10)
                
                Text("Taskademic")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)
                    .padding(.bottom, 2)
                
                Text("Organize, Optimize, Achieve")
                    .padding(.bottom, 30)
                    .foregroundColor(Color.init(red: 0, green: 0, blue: 0))
                
                Button("My Tasks") {
                    // Handle action
                }
                .buttonStyle(MainButtonStyle())
                
                Button("My Notes") {
                    // Handle action
                }
                .buttonStyle(MainButtonStyle())
                
                Button("My Events") {
                    // Handle action
                }
                .buttonStyle(MainButtonStyle())
                
                Button("Favorite List") {
                    // Handle action
                }
                .buttonStyle(MainButtonStyle())
                
                Spacer() // Pushes everything to the top
            }
            .offset(y: 80)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.3))
        .edgesIgnoringSafeArea(.all)
    }
}

// Button style
struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 60)
            .padding(.bottom, 7)
            .shadow(radius: 2)
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
