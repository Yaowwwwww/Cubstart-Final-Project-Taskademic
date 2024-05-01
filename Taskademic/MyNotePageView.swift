import SwiftUI

struct MyNotePageView: View {
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white.opacity(0.5))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    @State private var navigateToAddNote = false
    @State private var navigateToNoteDetail = false
    @EnvironmentObject var noteManager: TaskManager
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDetail:Bool = false
    @State var selectedNote: Note = Note(name: "", description: "", isStarred: false, isSelected: false)
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<noteManager.notes.count, id: \.self) { index in
                        Button(action: {
                            
                            self.selectedNote = noteManager.notes[index]
                            self.showingDetail = true
                        }) {
                            HStack {
                                Button(action: {
                                    self.noteManager.notes[index].isSelected.toggle()
                                }) {
                                    Image(systemName: noteManager.notes[index].isSelected ? "checkmark.square.fill" : "square")
                                }
                                
                                Text(noteManager.notes[index].name)
                                Spacer()
                                if noteManager.notes[index].isStarred {
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
                    for index in 0..<noteManager.notes.count {
                        if noteManager.notes[index].isSelected {
                            noteManager.notes[index].isStarred.toggle()
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
                    noteManager.removeSelectedNotes()
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
                AddNoteView()
            }

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
            .sheet(isPresented: $showingDetail) {
//                NoteDetail(note: $selectedNote, showingDetail: $showingDetail)
            }
        }
        
    }
}

struct MyNotePage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
