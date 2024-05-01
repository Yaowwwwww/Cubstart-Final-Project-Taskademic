import SwiftUI

struct AddNoteView: View {
    @EnvironmentObject var noteManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
    @State private var noteName: String = ""
    @State private var noteDescription: String = ""
    @State private var navigateToMyNotes = false
    @State private var isStarred: Bool = false

    var body: some View {
        
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $noteName)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: $noteDescription)
                            .frame(height: 200)
                    }
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: $isStarred) {
                            Text("Important Note")
                        }
                    }
                    
                    Section {
                        Button("Add Note") {
                            noteManager.notes.append(Note(name: noteName, description: noteDescription, isStarred: isStarred, isSelected: false))
                            self.navigateToMyNotes = true
                        }
                        .bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Add Note", displayMode: .inline)
            .navigationDestination(isPresented: $navigateToMyNotes) {
                MyNotePageView()
            }
            .navigationBarBackButtonHidden(true)
        }
        .onAppear {
            configureNavigationBar()
        }
        
    }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
}

struct AddNotePageView: PreviewProvider {
    static var previews: some View {
        AddNoteView().environmentObject(TaskManager())
    }
}
