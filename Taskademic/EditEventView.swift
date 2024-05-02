import SwiftUI

struct EditEventView: View {
    @Binding var event: Event
    @Binding var showingDetail: Bool
    @Binding var showingSheet: Bool
    @EnvironmentObject var eventManager: TaskManager
    @Environment(\.presentationMode) var presentationMode


    func updateEventBinding() -> Binding<Event> {
        guard let index = eventManager.events.firstIndex(where: { $0.id == event.id }) else {
            fatalError("Event with ID \(event.id) not found")
        }
        return $eventManager.events[index]
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: updateEventBinding().name)
                    }
                    
                    Section(header: Text("Date").bold().foregroundColor(.black)) {
                        DatePicker("", selection: updateEventBinding().date, in: Date()..., displayedComponents: .date)
                    }
                    
                    Section(header: Text("Time").bold().foregroundColor(.black)) {
                        DatePicker("", selection: updateEventBinding().time, displayedComponents: .hourAndMinute)
                    }
                    
                    Section(header: Text("Location / Description").bold().foregroundColor(.black)) {
                        TextField("", text: updateEventBinding().location)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: updateEventBinding().isStarred) {
                            Text("Important Note")
                        }
                    }
                    
                    Section {
                        Button("Done") {
                            showingSheet = false
                            showingDetail = false
                        }
                        .bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Edit Event", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            configureNavigationBar()
        }
    }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
}
