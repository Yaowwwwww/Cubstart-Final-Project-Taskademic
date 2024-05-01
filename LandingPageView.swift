import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
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

                VStack {
                    NavigationLink("My Tasks", destination: MyTaskPageView())
                        .buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()

                    NavigationLink("My Notes", destination: MyNotePageView())
                        .buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()

                    NavigationLink("My Events", destination: MyEventPageView())
                        .buttonStyle(MainButtonStyle())
                        .padding(.bottom, 10).bold()

//                    NavigationLink("High Priorities", destination: MyFavoritesPageView())
//                        .buttonStyle(MainButtonStyle())
//                        .padding(.bottom, 10).bold()
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
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


struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
