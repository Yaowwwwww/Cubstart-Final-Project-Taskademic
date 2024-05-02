import SwiftUI

struct EventDetail: View {
    @Binding var event: Event
    @Binding private var showingDetail: Bool
    @State private var navigateToEvents = false
    @State private var showingSheet = false
    @Environment(\.presentationMode) var presentationMode
    
    init(event: Binding<Event>, showingDetail: Binding<Bool>) {
        self._event = event
        self._showingDetail = showingDetail
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white.opacity(0.5))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text(event.name)
                        Text(event.date, format: Date.FormatStyle().year().month().day())
                        Text(event.time, format: Date.FormatStyle().hour().minute())
                        Text(event.location)
                    }
                }
                .bold()
                .font(.system(size: 20, design: .rounded))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(Color.white.opacity(0.83))
                        .shadow(radius: 3)
                )
                .padding(.top, 38)
                .frame(width: 340)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))
            
            Button(action: {
                self.showingSheet = true
            }){
                Text("Edit")
            }
            .bold()
            .padding()
            .frame(width: 340, height: 50)
            .foregroundColor(.black)
            .background(Color.white)
            .cornerRadius(10)
        }
        .navigationTitle(event.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToEvents) {
            MyTaskPageView()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showingSheet) {
            EditEventView(event: $event, showingDetail: $showingDetail ,showingSheet: $showingSheet)
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
