import SwiftUI

struct LandingPageView: View {
    @State private var navigateToTasks = false
    @State private var navigateToNotes = false
    @State private var navigateToEvents = false
    @State private var navigateToFavorites = false
    var body: some View {
        NavigationStack {
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
                        //Handle add task action
                        self.navigateToTasks = true
                    }.buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()
                    
                    Button("My Notes") {
                        //Handle add task action
                        self.navigateToNotes = true
                    }.buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()
                    
                    Button("My Events") {
                        //Handle add task action
                        self.navigateToEvents = true
                    }.buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()
                    
                    Button("High Priorities") {
                        //Handle add task action
                        self.navigateToFavorites = true
                    }.buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()

                    Spacer()
                }
                .offset(y: 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))
            .edgesIgnoringSafeArea(.all)
            .navigationDestination(isPresented: $navigateToTasks) {
                MyTaskPageView()
            }
            .navigationDestination(isPresented: $navigateToEvents) {
                MyEventPageView()
            }
            .navigationDestination(isPresented: $navigateToNotes) {
                MyNotePageView()
            }

        }
    }
}

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 60)
            .shadow(radius: 2)
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
