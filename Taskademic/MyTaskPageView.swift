//
//  NoteDetail.swift
//  Taskademic
//
//  Created by zhenwang on 4/17/24.
//

import SwiftUI

struct MyTaskPageView: View {
    
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
    
    
    @State private var navigateToAddTask = false
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Task list section
                List {
                    ForEach(0..<taskManager.tasks.count, id: \.self) { index in
                        HStack {
                            
                            Image(systemName: "square")
                            Text(taskManager.tasks[index].name)
                            Spacer()
                            if taskManager.tasks[index].isStarred {
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
                        //taskManager.tasks.remove(at: index)
                    }) {
                        Image(systemName: "chevron.left")
                            .padding()
                            .frame(width: 50, height: 47)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                    }
                    
                    
                    Button("Add Task") {
                        // Handle add task action
                        self.navigateToAddTask = true
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
                    taskManager.tasks.removeAll()
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
            .navigationBarItems(trailing: Button("Save") {
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddTask) {
                AddTaskView()}
        }
    }
}

struct MyTaskPage_Previews: PreviewProvider {
    static var previews: some View {
        MyTaskPageView().environmentObject(TaskManager())
    }
}
