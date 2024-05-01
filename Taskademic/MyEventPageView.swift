//
//  MyEventPageView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.
//

import SwiftUI

struct MyEventPageView: View {
    
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
    
    
    @State private var navigateToAddEvent = false
    @State private var navigateToEventDetail = false
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<taskManager.events.count, id: \.self) { index in
                        Button(action: {
//                            self.navigateToTaskDetail = true
                        }) {
                            HStack {
                                Button(action: {
                                    self.taskManager.events[index].isSelected.toggle()
                                }) {
                                    Image(systemName: taskManager.events[index].isSelected ? "checkmark.square.fill" : "square")
                                }
                                
                                Text(taskManager.events[index].name)
                                Spacer()
                                if taskManager.events[index].isStarred {
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
                    for index in 0..<taskManager.events.count {
                        if taskManager.events[index].isSelected {
                            taskManager.events[index].isStarred.toggle()
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
                    taskManager.removeSelectedEvents()
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
            .navigationBarTitle("My Events", displayMode: .inline)
            .navigationBarItems(trailing: Button("Add Event") {
                navigateToAddEvent = true
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddEvent) {
                AddEventView()}
            }
    }
}


struct MyEventPage_Previews: PreviewProvider {
    static var previews: some View {
        MyEventPageView().environmentObject(TaskManager())
    }
}
