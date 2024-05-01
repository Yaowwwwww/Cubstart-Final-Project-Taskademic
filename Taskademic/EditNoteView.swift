import SwiftUI

struct EditNoteView: View {
    @Binding var note: Note
    @Binding var showingDetail: Bool
    @Binding var showingSheet: Bool
    @EnvironmentObject var noteManager: TaskManager
    @Environment(\.presentationMode) var presentationMode


    func updateNoteBinding() -> Binding<Note> {
        guard let index = noteManager.notes.firstIndex(where: { $0.id == note.id }) else {
            fatalError("Note with ID \(note.id) not found")
        }
        return $noteManager.notes[index]
    }

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: updateNoteBinding().name)
                    }
                    
                    Section(header: Text("Description").bold().foregroundColor(.black)) {
                        TextEditor(text: updateNoteBinding().description)
                            .frame(height: 200)
                    }
                    
                    
                    Section(header: Text("Priority").bold().foregroundColor(.black)) {
                        Toggle(isOn: updateNoteBinding().isStarred) {
                            Text("Important Note")
                        }
                    }
                    
                    Section {
                        Button("Done") {
//                            presentationMode.wrappedValue.dismiss()
                            showingSheet = false
                            showingDetail = false
                            // Any action to perform on done
                        }
                        .bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
            }
            .background(Color.blue)
            .navigationBarTitle("Edit Note", displayMode: .inline)
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
