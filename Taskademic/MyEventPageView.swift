//
//  MyEventPageView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.
//

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
    
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToAddEvent = false
    @State private var navigateToEventDetail = false
    @EnvironmentObject var eventManager: TaskManager
    @State private var showingDetail: Bool = false
    @State var selectedEvent: Event = Event(name: "", date: Date(), time: Date(), location: "", isStarred: false)
    @EnvironmentObject var taskManager: TaskManager
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    ForEach(0..<eventManager.events.count, id: \.self) { index in
                        Button(action: {
                            self.selectedEvent = eventManager.events[index]
                            self.showingDetail = true
                        }) {
                            HStack {
                                Button(action: {
                                    self.eventManager.events[index].isSelected.toggle()
                                }) {
                                    Image(systemName: eventManager.events[index].isSelected ? "checkmark.square.fill" : "square")
                                }
                                
                                
                                eventDetailView(for: (name: taskManager.events[index].name, date: taskManager.events[index].date, time: taskManager.events[index].time, location: taskManager.events[index].location, isStarred: taskManager.events[index].isStarred))

                                Spacer()
                                if eventManager.events[index].isStarred {
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
                
                
                Divider()
                    .padding(.bottom,11)
                
                Button(action: {
                    for index in 0..<eventManager.events.count {
                        if eventManager.events[index].isSelected {
                            eventManager.events[index].isStarred.toggle()
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
                    eventManager.removeSelectedEvents()
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
            .navigationBarTitle("My Events", displayMode: .inline)
            .navigationBarItems(trailing: Button("Add Event") {
                navigateToAddEvent = true
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
            .foregroundColor(.blue))
            .navigationDestination(isPresented: $navigateToAddEvent) {
                AddEventView()}
            }
            .sheet(isPresented: $showingDetail) {
                EventDetail(event: $selectedEvent, showingDetail: $showingDetail)
            }
    }
}


public func eventDetailView(for event: (name: String, date: Date, time:Date, location: String, isStarred: Bool)) -> some View {
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


