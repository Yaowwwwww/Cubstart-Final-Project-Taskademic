//
//  MyEventPageView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.
//

import Foundation
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
    
    @State var tasks = [
        (name: "Event 1", isStarred: true),
        (name: "Event 2", isStarred: false),
        (name: "Event 3", isStarred: true),
        (name: "Event 4", isStarred: true),
        (name: "Event 5", isStarred: false)
    ]
    @State private var navigateToAddEvent = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Task list section
                List {
                    ForEach(0..<tasks.count, id: \.self) { index in
                        HStack {
                           
                            Text(tasks[index].name)
                            Spacer()
                            if tasks[index].isStarred {
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
                    
                    
                    Button("Add Event") {
                        // Handle add task action
                        self.navigateToAddEvent = true
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
            .navigationBarTitle("My Events", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
            }
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddEvent) {
                AddEventView()}
        }
    }
}

struct MyEventPage_Previews: PreviewProvider {
    static var previews: some View {
        MyEventPageView()
    }
}
