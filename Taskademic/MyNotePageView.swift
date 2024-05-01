//
//  MyNotePageView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.


import SwiftUI

struct MyNotePageView: View {
    
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
    
    
    @State private var navigateToAddNote = false
    @State private var navigateToNoteDetail = false
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<taskManager.notes.count, id: \.self) { index in
                        Button(action: {
//                            self.navigateToTaskDetail = true
                        }) {
                            HStack {
                                Button(action: {
                                    self.taskManager.notes[index].isSelected.toggle()
                                }) {
                                    Image(systemName: taskManager.notes[index].isSelected ? "checkmark.square.fill" : "square")
                                }
                                
                                Text(taskManager.notes[index].name)
                                Spacer()
                                if taskManager.notes[index].isStarred {
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
                    for index in 0..<taskManager.notes.count {
                        if taskManager.notes[index].isSelected {
                            taskManager.notes[index].isStarred.toggle()
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
                    taskManager.removeSelectedNotes()
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
            .navigationBarTitle("My Notes", displayMode: .inline)
            .navigationBarItems(trailing: Button("Add Note") {
                navigateToAddNote = true
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddNote) {
                AddNoteView()}
            }
            .onAppear {
                navigateToAddNote = false
            }
    }
}

struct MyNotePage_Previews: PreviewProvider {
    static var previews: some View {
        MyNotePageView().environmentObject(TaskManager())
    }
}
