//
//  TaskTableViewCell.swift
//  TaskApp
//
//  Created by Myles Cashwell on 4/21/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: TaskCompletionDelegate?
    
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.taskCellButtonTapped(self)
        }
    }
    
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameLabel.text = task.taskName
        completionButton.setBackgroundImage(task.isComplete ? UIImage(named: "complete") : UIImage(named: "incomplete"), for: .normal)
    }
    
}
