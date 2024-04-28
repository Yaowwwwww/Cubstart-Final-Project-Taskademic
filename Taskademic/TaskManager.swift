//
//  TaskManager.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/24/24.
//

import Combine
import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [(name: String, isStarred: Bool, completed: Bool)] = []
    @Published var notes: [(name: String, isStarred: Bool)] = []
    @Published var events: [(name: String, date: Date, time: Date, location: String, isStarred: Bool)] = []
    
}




