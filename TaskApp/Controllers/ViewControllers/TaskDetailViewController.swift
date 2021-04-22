//
//  TaskDetailViewController.swift
//  TaskApp
//
//  Created by Myles Cashwell on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let taskNameText = taskNameTextField.text, !taskNameText.isEmpty,
              let taskNotesText = taskNotesTextView.text,
              let taskDueDate = taskDueDatePicker?.date else { return }
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: taskNameText, notes: taskNotesText, dueDate: taskDueDate)
        } else {
            TaskController.sharedInstance.createTaskWith(name: taskNameText, notes: taskNotesText, dueDate: taskDueDate)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: UIDatePicker) {
        date = sender.date
        print(date as Any)
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.taskName
        taskNotesTextView.text = task.taskNotes
        taskDueDatePicker.date = task.taskDueDate ?? Date()
    }
}
