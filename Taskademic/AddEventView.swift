import SwiftUI

struct AddEventView: View {
    
    @State private var eventName: String = ""
    @State private var dueDate: Date = Date()
    @State private var location: String = ""
    @State private var navigateToMyEvents = false
    @EnvironmentObject var taskManager: TaskManager
    @State private var isStarred: Bool = false
    @State private var showAlert = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $eventName)
                    }
                    
                    Section(header: Text("Date").bold().foregroundColor(.black)) {
                        DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date)
                    }
                    
                    Section(header: Text("Location").bold().foregroundColor(.black)) {
                        TextField("Location", text: $location)
                    }
                    
                    Section {
                        Button("Add Event") {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd"
                            let selectedDateStr = formatter.string(from: dueDate)
                            
                            taskManager.events.append((name: eventName, isStarred:isStarred))
                            navigateToMyEvents = true
                            
                        }
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationBarTitle("Add Event", displayMode: .inline)
            .background(Color.blue)
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
