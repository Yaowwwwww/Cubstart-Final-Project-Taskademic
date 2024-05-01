//
//  NoteDetail.swift
//  Taskademic
//
//  Created by zhenwang on 4/17/24.
//

import SwiftUI

struct MyTaskPageView: View {
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white.opacity(0.5))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    @State private var navigateToAddTask = false
    @State private var navigateToTaskDetail = false
    @EnvironmentObject var taskManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showingSheet = false
    
    @State private var selectedTask: Task?
    
    var body: some View {
    
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<taskManager.tasks.count, id: \.self) { index in
                        Button(action: {
                            self.selectedTask = taskManager.tasks[index]
                            self.showingSheet = true
                        }) {
                            HStack {
                                Button(action: {
                                    self.taskManager.tasks[index].isSelected.toggle()
                                }) {
                                    Image(systemName: taskManager.tasks[index].isSelected ? "checkmark.square.fill" : "square")
                                }
                                
                                Text(taskManager.tasks[index].name)
                                Spacer()
                                if taskManager.tasks[index].isStarred {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .frame(width: 10, height: 20)
                                }
                                
                            }
                            .bold()
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                        }
                        .listRowBackground(Color.blue.opacity(0))
                    }
                }
                .padding(.top, 10)
                .listStyle(PlainListStyle())
                
                Button(action: {
                    for index in 0..<taskManager.tasks.count {
                        if taskManager.tasks[index].isSelected {
                            taskManager.tasks[index].isStarred.toggle()
                        }
                    }
                }){
                    Text("Mark/Unmark Selected")
                }
                .bold()
                .padding()
                .frame(width: 340, height: 50)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(10)
                
                Spacer()
                Spacer()
                
                Button (action: {
                    taskManager.removeSelectedTasks()
                }){
                    Text("Delete Selected")
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
            .navigationBarItems(trailing: Button("Add Task") {
                navigateToAddTask = true
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddTask) {
                AddTaskView()}

            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.blue) // Set the color of the arrow to blue
                    }
                }
            }
            
            .onAppear {
                configureNavigationBar()
            }
            .sheet(item: $selectedTask) { task in
                TaskDetail(task: .constant(task))
            }
        }
        
    }
}

struct MyTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
