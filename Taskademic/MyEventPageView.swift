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
    @EnvironmentObject var taskManager: TaskManager
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Task list section
                List {
                    ForEach(0..<taskManager.events.count, id: \.self) { index in
                        HStack {
                           
                            eventDetailView(for: (name: taskManager.events[index].name, date: taskManager.events[index].date, time: taskManager.events[index].time, location: taskManager.events[index].location, isStarred: taskManager.events[index].isStarred))

                            Spacer()
                            if taskManager.events[index].isStarred {
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
                
                Button("Delete All") {
                    taskManager.events.removeAll()
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

private func eventDetailView(for event: (name: String, date: Date, time:Date, location: String, isStarred: Bool)) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(event.name)
            HStack(){
                Text(formatDate(event.date))
                               .foregroundColor(.gray)
                               .font(.caption)
                Text(formatTime(event.time))
                               .foregroundColor(.gray)
                               .font(.caption)
            }
            Text(event.location).foregroundColor(.gray)
                .font(.caption)
        }
    }

private func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy"
    return dateFormatter.string(from: date)
}

private func formatTime(_ time: Date) -> String {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "h:mm a"
    return timeFormatter.string(from: time)
}

struct MyEventPage_Previews: PreviewProvider {
    static var previews: some View {
        MyEventPageView().environmentObject(TaskManager())
    }
}
