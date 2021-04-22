//
//  Task.swift
//  TaskApp
//
//  Created by Myles Cashwell on 4/21/21.
//

import Foundation

class Task: Codable {
    var taskName: String
    var taskNotes: String?
    var taskDueDate: Date?
    var isComplete: Bool
    
    let uuid: String
    
    init(taskName: String, taskNotes: String?, taskDueDate: Date?, taskIsComplete: Bool = false, uuid: String = UUID().uuidString) {
        self.taskName = taskName
        self.taskNotes = taskNotes
        self.taskDueDate = taskDueDate
        self.isComplete = taskIsComplete
        self.uuid = uuid
    }
}

//MARK: - Extensions
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
