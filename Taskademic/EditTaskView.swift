import SwiftUI

struct EditTaskView: View {
    @Binding var task: (name: String, description: String, isStarred: Bool, isSelected: Bool)

    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $task.name)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: $task.description)
                            .frame(height: 200)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: $task.isStarred) {
                            Text("Important Task")
                        }
                    }
                    
                    Section {
                        Button("Save Task") {
//                            taskManager.tasks.append((name: taskName, description: taskDescription, isStarred: isStarred, isSelected: false))
//                            self.navigateToMyTasks = true
                        }
                        .bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Edit Task", displayMode: .inline)
        
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

struct EditTaskPageView: PreviewProvider {
    static var previews: some View {
        EditTaskView().environmentObject(TaskManager())
    }
}
