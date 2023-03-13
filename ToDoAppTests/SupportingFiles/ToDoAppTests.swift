//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by sss on 08.03.2023.
//

import XCTest
@testable import ToDoApp

final class ToDoAppTests: XCTestCase {

    //хочу проверить что при загрузке нашего приложения главный экран taskListVC

    func testInitialViewControllerIsTaskListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //Creates the initial view controller and initializes it with the data from the storyboard.
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let rootViewController = navigationController.viewControllers.first as! TaskListViewController
        
        XCTAssertTrue(rootViewController is TaskListViewController)
    }
}
