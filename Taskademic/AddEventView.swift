import SwiftUI

struct AddEventView: View {

    
    @State private var eventName: String = ""
    @State private var eventDate: Date = Date()
    @State private var eventTime: Date = Date()
    @State private var eventLocation: String = ""
    @State private var navigateToMyEvents = false
    @State private var isStarred: Bool = false
    @EnvironmentObject var taskManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $eventName)
                    }
                    
                    Section(header: Text("Date").bold().foregroundColor(.black)) {
                        DatePicker("", selection: $eventDate, in: Date()..., displayedComponents: .date)
                    }
                    
                    Section(header: Text("Time").bold().foregroundColor(.black)) {
                        DatePicker("", selection: $eventTime, displayedComponents: .hourAndMinute)
                                        }
                    
                    Section(header: Text("Location / Description").bold().foregroundColor(.black)) {
                        TextField("", text: $eventLocation)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: $isStarred) {
                            Text("Important Event")
                        }
                    }
                    
                    Section {
                        Button("Add Event") {
                            taskManager.events.append(Event(name: eventName, date:eventDate, time: eventTime, location: eventLocation, isStarred: isStarred, isSelected: false))
                            navigateToMyEvents = true
                        }
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }.background(Color.blue)
            .navigationBarTitle("Add Event", displayMode: .inline)
            .navigationDestination(isPresented: $navigateToMyEvents) {
                MyEventPageView()
            }
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView().environmentObject(TaskManager())
    }
}
