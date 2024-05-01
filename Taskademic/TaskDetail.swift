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
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(task.description)
                    .font(.system(size: 20, design: .rounded))
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color.white.opacity(0.8))
                    .shadow(radius: 5)
            )
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.4))
        .navigationTitle(task.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    navigateToTasks = true
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue) // Set the color of the arrow to blue
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToTasks) {
            MyTaskPageView(navigateToTasks: $navigateToTasks)
        }
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TaskDetail(task: (name: "Example Task", description: "This ", isStarred: true, isSelected: false))
        }
    }
}
