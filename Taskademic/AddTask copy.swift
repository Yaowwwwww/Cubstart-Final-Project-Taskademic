import SwiftUI

struct AddTaskView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white.opacity(0.5))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
        ]
            
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $taskName)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: $taskDescription)
                            .frame(height: 200)
                    }
                    
                    Section {
                        Button("Add Task") {
                            //Handle add task action
                        }
                    }.bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }.background(Color.blue)
                .navigationBarTitle("Add Task", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {

                }) {
                    Image(systemName: "arrow.left").foregroundColor(.black)
                }
                .foregroundColor(.blue))
        }
    }
}
                
    



struct AddTaskPageView: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
