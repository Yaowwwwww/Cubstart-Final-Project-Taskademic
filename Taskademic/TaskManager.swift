//
//  TaskManager.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/24/24.
//

import Combine
import Foundation

struct Task: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var isStarred: Bool
    var isSelected: Bool = false
}

struct Note: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var isStarred: Bool
    var isSelected: Bool = false
}

struct Event: Identifiable {
    var id: UUID = UUID()
    var name: String
    var date: Date
    var time: Date
    var location: String
    var isStarred: Bool
    var isSelected: Bool = false
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var notes: [Note] = []
    @Published var events: [Event] = []
    
    func removeSelectedTasks() {
        tasks.removeAll { $0.isSelected }
    }
    func removeSelectedNotes() {
        notes.removeAll { $0.isSelected }
    }
    func removeSelectedEvents() {
        events.removeAll { $0.isSelected }
    }
}




