import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task
    @Binding var showingDetail: Bool
    @Binding var showingSheet: Bool
    @EnvironmentObject var taskManager: TaskManager
    @Environment(\.presentationMode) var presentationMode

    // 获取与 task.id 相关联的 Task 的 Binding
    func updateTaskBinding() -> Binding<Task> {
        guard let index = taskManager.tasks.firstIndex(where: { $0.id == task.id }) else {
            fatalError("Task with ID \(task.id) not found")
        }
        return $taskManager.tasks[index]
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: updateTaskBinding().name)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextField("Description", text: updateTaskBinding().description)
                            .frame(height: 200)
                    }
                    
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: updateTaskBinding().isStarred) {
                            Text("Important Task")
                        }
                    }
                    
                    Section {
                        Button("Done") {
//                            presentationMode.wrappedValue.dismiss()
                            showingSheet = false
                            showingDetail = false
                            // Any action to perform on done
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
