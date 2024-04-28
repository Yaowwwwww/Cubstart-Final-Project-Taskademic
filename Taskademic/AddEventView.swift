import SwiftUI

struct AddEventView: View {
    
    @State private var eventName: String = ""
    @State private var dueDate: Date = Date()
    @State private var addedTime: Date = Date()
    @State private var addedLocation: String = ""
    @State private var navigateToMyEvents = false
    @EnvironmentObject var taskManager: TaskManager
    @State private var isStarred: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $eventName)
                    }
                    
                    Section(header: Text("Date").bold().foregroundColor(.black)) {
                        DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date)
                    }
                    
                    Section(header: Text("Time").bold().foregroundColor(.black)) {
                        DatePicker("", selection: $addedTime, displayedComponents: .hourAndMinute)
                                        }
                    
                    Section(header: Text("Location").bold().foregroundColor(.black)) {
                        TextField("Location", text: $addedLocation)
                    }
                    
                    Section {
                        Button("Add Event") {
                            taskManager.events.append((name: eventName, date:dueDate, time: addedTime, location: addedLocation, isStarred:isStarred))
                            navigateToMyEvents = true
                            
                        }
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }.background(Color.blue).navigationBarTitle("Add Event", displayMode: .inline)
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
