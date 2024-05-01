//
//  TaskManager.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/24/24.
//

import Combine
import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [(name: String, description: String, isStarred: Bool, isSelected: Bool)] = []
    @Published var notes: [(name: String, description: String, isStarred: Bool, isSelected: Bool)] = []
    @Published var events: [(name: String, date: Date, time: Date, location: String, isStarred: Bool, isSelected: Bool)] = []
    
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




