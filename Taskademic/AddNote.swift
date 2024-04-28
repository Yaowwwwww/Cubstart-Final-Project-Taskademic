//
//  AddNote.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.
//

import Foundation
import SwiftUI

struct AddNoteView: View {
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
    
    @EnvironmentObject var taskManager: TaskManager
    @State private var noteName: String = ""
    @State private var taskDescription: String = ""
    @State private var navigateToMyNotes = false
    @State private var isStarred: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $noteName)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: $taskDescription)
                            .frame(height: 200)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: $isStarred) {
                            Text("Important Note")
                            
                        }
                    }
                    
                    Section {
                        Button("Add Note") {
                            //Handle add task action
                            taskManager.notes.append((name: noteName, isStarred: isStarred))
                            self.navigateToMyNotes = true
                        }
                    }.bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                    
                }
            }.background(Color.blue)
                .navigationBarTitle("Add Note", displayMode: .inline)
                .navigationDestination(isPresented: $navigateToMyNotes) {
                    MyNotePageView()
                }
            }
        }
    }

                
    



struct AddNotePageView: PreviewProvider {
    static var previews: some View {
        AddNoteView().environmentObject(TaskManager())
    }
}
