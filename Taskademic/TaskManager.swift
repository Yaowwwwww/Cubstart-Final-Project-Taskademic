//
//  TaskManager.swift
//  Taskademic
//
//  Created by Dina Khatri on 4/24/24.
//

import Combine

class TaskManager: ObservableObject {
    @Published var tasks: [(name: String, isStarred: Bool, completed: Bool)] = []
}




