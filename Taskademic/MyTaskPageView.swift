import SwiftUI

struct MyTaskPageView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.init(red: 112, green: 215, blue: 255))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
        ]
            
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
                        .bold()
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .listRowBackground(Color.blue.opacity(0))
                    }
                }
                .padding(.top, 10)
                .listStyle(PlainListStyle())
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        // Handle previous page action
                    }) {
                        Image(systemName: "chevron.left")
                            .padding()
                            .frame(width: 50, height: 47)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                    }
                    
                    
                    Button("Add Task") {
                        // Handle add task action
                    }
                    .bold()
                    .padding()
                    .frame(width: 200, height: 50)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button(action: {
                        // Handle next page action
                    }) {
                        Image(systemName: "chevron.right")
                            .padding()
                            .frame(width: 50, height: 47)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                
                Spacer()
                Spacer()
                // Delete all button
                Button("Delete All") {
                    // Handle delete all action
                }
                .bold()
                .frame(width: 340, height: 50)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                
                Spacer()
            }
            .background(Color.blue.opacity(0.4))
            .navigationBarTitle("My Tasks", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "arrow.left"),
                                trailing: Button("Saved") {
            }
            .foregroundColor(.blue))
        }
    }
}

struct MyTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        MyTaskPageView()
    }
}
