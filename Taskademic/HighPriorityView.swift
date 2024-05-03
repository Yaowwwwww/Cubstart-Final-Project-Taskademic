//
//  NoteDetail.swift
//  Taskademic
//
//  Created by zhenwang on 4/17/24.
//

import SwiftUI

struct HighPriorityView: View {
    
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
    @State private var showingTaskDetail: Bool = false
    @State private var showingNoteDetail: Bool = false
    @State private var showingEventDetail: Bool = false
    
    @State var selectedTask: Task = Task(name: "", description: "", isStarred: false, isSelected: false)
    
    @State var selectedNote: Note = Note(name: "", description: "", isStarred: false, isSelected: false)
    
    @State var selectedEvent: Event = Event(name: "", date: Date(), time: Date(), location: "", isStarred: false, isSelected: false)
    
    var body: some View {

        NavigationStack {
            VStack {
                HStack {
                    Text("Tasks")
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 83, height: 32, alignment: .leading)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.bottom, 1)
                .padding(.leading, 27)
                
                Divider()
                    .padding(.bottom, -58)
                
                List {
                    ForEach(Array(taskManager.tasks.enumerated()), id: \.element.id) { index, task in
                        if (task.isStarred) {
                            Button(action: {
                                
                                self.selectedTask = taskManager.tasks[index]
                                self.showingTaskDetail = true
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
                }
                .padding(.top, -5)
                .listStyle(PlainListStyle())
                .frame(width: 377, height: 124)
                
                Spacer()
                
                HStack {
                    Text("Notes")
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 86, height: 32, alignment: .leading)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    Spacer()
                }
                .padding(.top, 1)
                .padding(.bottom, 1)
                .padding(.leading, 27)
                
                Divider()
                    .padding(.bottom,-58)
                
                List {
                    ForEach(Array(taskManager.notes.enumerated()), id: \.element.id) { index, note in
                        if (note.isStarred) {
                            Button(action: {
                                
                                self.selectedNote = taskManager.notes[index]
                                self.showingNoteDetail = true
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
                }
                .padding(.top, -5)
                .listStyle(PlainListStyle())
                .frame(width: 377, height: 124)
                
                Spacer()
                
                HStack {
                    Text("Events")
                        .font(.system(size: 19, weight: .bold, design: .rounded))
                        .padding()
                        .frame(width: 93, height: 32, alignment: .leading)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    Spacer()
                }
                .padding(.top, 1)
                .padding(.bottom, 1)
                .padding(.leading, 27)
                
                Divider()
                    .padding(.bottom, -58)
                
                List {
                    ForEach(Array(taskManager.events.enumerated()), id: \.element.id) { index, event in
                        if (event.isStarred) {
                            Button(action: {
                                
                                self.selectedEvent = taskManager.events[index]
                                self.showingEventDetail = true
                            }) {
                                HStack {
                                    Button(action: {
                                        self.taskManager.events[index].isSelected.toggle()
                                    }) {
                                        Image(systemName: taskManager.events[index].isSelected ? "checkmark.square.fill" : "square")
                                    }
                                    
                                    eventDetailView(for: (name: taskManager.events[index].name, date: taskManager.events[index].date, time: taskManager.events[index].time, location: taskManager.events[index].location, isStarred: taskManager.events[index].isStarred))

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
                }
                .padding(.top, -5)
                .listStyle(PlainListStyle())
                .frame(width: 377, height: 124)
//                
                Spacer()
                
                Divider()
                
                Spacer()
                Button(action: {
                    for index in 0..<taskManager.tasks.count {
                        if taskManager.tasks[index].isSelected {
                            taskManager.tasks[index].isStarred.toggle()
                        }
                    }
                    for index in 0..<taskManager.notes.count {
                        if taskManager.notes[index].isSelected {
                            taskManager.notes[index].isStarred.toggle()
                        }
                    }
                    for index in 0..<taskManager.notes.count {
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
                
                Button (action: {
                    taskManager.removeSelectedTasks()
                    taskManager.removeSelectedNotes()
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
                
            }
            .background(Color.blue.opacity(0.4))
            .navigationBarTitle("High Priority Tasks", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.blue)
                    }
                }
            }
            
            .onAppear {
                configureNavigationBar()
            }
            .sheet(isPresented: $showingTaskDetail) {
                TaskDetail(task: $selectedTask, showingDetail: $showingTaskDetail)
            }
            .sheet(isPresented: $showingNoteDetail) {
                NoteDetail(note: $selectedNote, showingDetail: $showingNoteDetail)
            }
            .sheet(isPresented: $showingEventDetail) {
                EventDetail(event: $selectedEvent, showingDetail: $showingEventDetail)
            }
        }
    }
}


struct HighPriority_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityView().environmentObject(TaskManager())
    }
}
