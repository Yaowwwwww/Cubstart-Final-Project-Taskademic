//
//  AddEventView.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/18/24.
//

import Foundation
import SwiftUI

struct AddEventView: View {
    
    @State private var eventName: String = ""
    @State private var dueDate: String = ""
    @State private var location: String = ""
    @State private var navigateToMyEvents = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Title").bold().foregroundColor(.black)) {
                        TextField("Title", text: $eventName)
                    }
                    
                    Section(header: Text("Due Date").bold().foregroundColor(.black)) {
                        TextField("Please enter the due date",text: $dueDate)
                            
                    }
                    
                    Section(header: Text("location").bold().foregroundColor(.black)) {
                        TextField("Location",text: $location)
                            
                    }
                    Section {
                        Button("Add Event") {
                            //Handle add task action
                            self.navigateToMyEvents = true
                        }
                    }.bold()
                        .frame(width: 500, height: 30)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }.background(Color.blue)
                .navigationBarTitle("Add Event", displayMode: .inline)
                .navigationDestination(isPresented: $navigateToMyEvents) {
                    MyEventPageView()
                }
            }
        }
    }
    



struct AddEventViewPreview: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
