

import SwiftUI

struct MyTaskPageView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.blue.opacity(0))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    @State var tasks = [
        (name: "Task 1", isStarred: true),
        (name: "Task 2", isStarred: false),
        (name: "Task 3", isStarred: true),
        (name: "Task 4", isStarred: true),
        (name: "Task 5", isStarred: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                // Task list section
                List {
                    ForEach(0..<tasks.count, id: \.self) { index in
                        HStack {
                            Image(systemName: "square")
                            Text(tasks[index].name)
                            Spacer()
                            if tasks[index].isStarred {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        .padding()
                        .background(Color.blue.opacity(0.0))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .listRowBackground(Color.blue.opacity(0))
                    }
                }
                .listStyle(PlainListStyle())
                

                // Button and navigation area
                HStack {
                    Button(action: {
                        // Handle previous page action
                    }) {
                        Image(systemName: "chevron.left")
                            .padding()
                    }

                    Spacer()

                    Button("Add Task") {
                        // Handle add task action
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)

                    Spacer()

                    Button(action: {
                        // Handle next page action
                    }) {
                        Image(systemName: "chevron.right")
                            .padding()
                    }
                }
                .padding()

                // Delete all button
                Button("Delete All") {
                    // Handle delete all action
                }
                .padding()
                .foregroundColor(.black)
                .background(Color.white) // Distinct color for important actions
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .background(Color.blue.opacity(0.4)) // Background color for the entire view
            .navigationBarTitle("My Tasks", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "arrow.left"),
                                trailing: Button("Saved") {
                                    // Handle save action
                                }.foregroundColor(.blue))
        }
    }
}

struct MyTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        MyTaskPageView()
    }
}
