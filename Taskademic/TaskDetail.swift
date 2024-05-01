import SwiftUI

struct TaskDetail: View {
    var task: (name: String, description: String, isStarred: Bool, isSelected: Bool)
    @State private var navigateToTasks = false

    init(task: (name: String, description: String, isStarred: Bool, isSelected: Bool)) {
        self.task = task
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
                    Text(task.description)
                        .font(.system(size: 20, design: .rounded))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(Color.white.opacity(0.8))
                                .shadow(radius: 5)
                        )
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.4))

            Button(action: {
                
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
        .navigationTitle(task.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToTasks) {
            MyTaskPageView()
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskDetail(task: (name: "Example Task", description: "Detailed description of the task.", isStarred: true, isSelected: false))
        }
    }
}
