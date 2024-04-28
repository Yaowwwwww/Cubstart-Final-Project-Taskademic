//
//  MyNotePageView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.



import Foundation
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
    
    @State var tasks = [
        (name: "Note 1", isStarred: true),
        (name: "Note 2", isStarred: false),
        (name: "Note 3", isStarred: true),
        (name: "Note 4", isStarred: true),
        (name: "Note 5", isStarred: false)
    ]
    @State private var navigateToAddNote = false
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Task list section
                List {
                    ForEach(0..<taskManager.notes.count, id: \.self) { index in
                        HStack {
                           
                            Text(taskManager.notes[index].name)
                            Spacer()
                            if taskManager.notes[index].isStarred {
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
                    
                    
                    Button("Add Note") {
                        // Handle add task action
                        self.navigateToAddNote = true
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
            .navigationBarTitle("My Notes", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddNote) {
                AddNoteView()}
        }
    }
}

struct MyNotePage_Previews: PreviewProvider {
    static var previews: some View {
        MyNotePageView().environmentObject(TaskManager())
    }
}
