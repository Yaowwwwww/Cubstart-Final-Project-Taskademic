import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var navigateToMyTasks = false
    @State private var isStarred: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $taskName)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: $taskDescription)
                            .frame(height: 200)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: $isStarred) {
                            Text("Important Task")
                            
                        }
                    }
                    
                    Section {
                        Button("Add Task") {
                            taskManager.tasks.append((name: taskName, isStarred: isStarred, completed: false))
                            self.navigateToMyTasks = true
                        }
                    }.bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                }
            }.background(Color.blue)
                .navigationBarTitle("Add Task", displayMode: .inline)
                .navigationDestination(isPresented: $navigateToMyTasks) {
                    MyTaskPageView()
                }
            }
        }
    }

struct AddTaskPageView: PreviewProvider {
    static var previews: some View {
        AddTaskView().environmentObject(TaskManager())
    }
}