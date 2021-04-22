//
//  TaskController.swift
//  TaskApp
//
//  Created by Myles Cashwell on 4/21/21.
//

import Foundation

class TaskController {
    
    //MARK: - Properties
    static let sharedInstance = TaskController()
    var tasks: [Task] = []
    
    
    //MARK: - Functions
    /// CRUD Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(taskName: name, taskNotes: notes, taskDueDate: dueDate)
        tasks.append(newTask)
        saveToPersistenceStore()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.taskName = name
        task.taskNotes = notes
        task.taskDueDate = dueDate
        saveToPersistenceStore()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        saveToPersistenceStore()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        saveToPersistenceStore()
    }
    
    
    //MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileUrl = url[0].appendingPathComponent("Task.json")
        return fileUrl
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
