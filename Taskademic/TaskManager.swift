//
//  TaskManager.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/24/24.
//

import Combine
import Foundation

struct Task: Identifiable {
    var id: UUID = UUID()  // 每个任务实例自动获得一个独特的 UUID
    var name: String
    var description: String
    var isStarred: Bool
    var isSelected: Bool = false
}

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
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




