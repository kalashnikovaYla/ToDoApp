//
//  TaskListViewController.swift
//  ToDoApp
//
//  Created by sss on 08.03.2023.
//

import UIKit

class TaskListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var dataProvider: DataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewTask(_ sender: UIBarButtonItem) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController {
            present(viewController, animated: true)
        }
    }
}
