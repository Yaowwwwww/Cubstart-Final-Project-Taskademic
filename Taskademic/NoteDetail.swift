//
//  NoteDetail.swift
//  Taskademic
//
//  Created by zhenwang on 4/28/24.
//


import SwiftUI

struct NoteDetail: View {
    @State private var isFavorite = false

    init() {
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
        VStack {
            CardView(title: "Task 1", description: "Some Description...")
                .padding()

            Spacer()

            HStack(spacing: 20) {
                Button(action: {
                    // Your code for deleting the note goes here
                }) {
                    Text("Delete Note")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }

                Button(action: {
                    self.isFavorite.toggle()
                    // Your code for marking/unmarking as favorite goes here
                }) {
                    Text(isFavorite ? "Unmark as Favorite" : "Mark as Favorite")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
            }.padding()
        }
        .background(Color.blue.opacity(0.4))
        .navigationTitle("Note 1")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            // Your code for back action goes here
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        })
    }
}

struct CardView1: View {
    var title: String
    var description: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.white.opacity(0.6))
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding([.top, .leading, .trailing])
                
                Text(description)
                    .font(.subheadline)
                    .padding([.leading, .bottom, .trailing])
            }
        }
        .frame(height: 600)
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteDetail()
        }
    }
}


