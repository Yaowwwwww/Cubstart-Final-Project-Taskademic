import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationView {
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

                    NavigationLink(destination: MyTaskPageView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("My Tasks")
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 10)

                    NavigationLink(destination: MyTaskPageView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("My Notes")
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 10)

                    NavigationLink(destination: MyTaskPageView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("My Events")
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 10)

                    NavigationLink(destination: MyTaskPageView().navigationBarTitle("").navigationBarHidden(true)) {
                        Text("Favorite List")
                    }
                    .buttonStyle(MainButtonStyle())
                    .padding(.bottom, 10)

                    Spacer()
                }
                .offset(y: 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))
            .edgesIgnoringSafeArea(.all)
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
        LandingPageView()
    }
}
