import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
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
                            taskManager.tasks.append((name: taskName, description: taskDescription, isStarred: isStarred, isSelected: false))
                            self.navigateToMyTasks = true
                        }
                        .bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationDestination(isPresented: $navigateToMyTasks) {
                MyTaskPageView()
            }
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

struct AddTaskPageView: PreviewProvider {
    static var previews: some View {
        AddTaskView().environmentObject(TaskManager())
    }
}
