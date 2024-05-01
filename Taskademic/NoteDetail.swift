import SwiftUI

struct NoteDetail: View {
    var note: (name: String, description: String, isStarred: Bool, isSelected: Bool)

    init(note: (name: String, description: String, isStarred: Bool, isSelected: Bool)) {
        self.note = note
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.white.opacity(0.5))
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.8))
                .shadow(radius: 10)
                .frame(width: 339, height: 620)
            VStack {
                Text(note.description)
                    .font(.system(size: 20, design: .rounded))
                Spacer()
            }
            .frame(width: 310, height: 610, alignment: .leading)
            .padding(.top, 23)
            .padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.4))
        .navigationTitle(note.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteDetail(note: (name: "Example Note", description: "Detailed description of the note goes here. Include all relevant details to make sure it is clear.", isStarred: true, isSelected: false))
        }
    }
}
