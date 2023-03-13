//
//  ManagerTaskTest.swift
//  ToDoAppTests
//
//  Created by sss on 08.03.2023.
//

import XCTest
@testable import ToDoApp

final class ManagerTaskTest: XCTestCase {

    var sut: TaskManager!
    
    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitTaskManagerWithZeroTasks() {
        
        //количество заданий нашего менеджера дб равно нулю
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    func testInitTaskManagerWithZeroDoneTasks() {
        
        //количество заданий нашего менеджера дб равно нулю
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    //тест проверяющий что при добавлении задачи наш такс каунт увеличится на 1
    func testAddTasksIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    // проверяем что добавленный таск это и есть тот самый таск по добавленному индексу
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
    
    //Написать тест в котором мы с вами проверим, что обозначая задачу выполненой, у нас действительно меняется количество задач, которые нужно выполнить, и количество задач, которые уже выполнены
    func testCheckTaskAtIndexChangesCount(){
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    //Действительно ли удаляется task
    func testCheckedRemovedFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    
    //проверим что задача которая у нас выполнена, она в итоге попадает в свой массив, который мы также будем использовать для отображения уже выполненных задач
    func testDoneTaskAtRerurnsCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTasks(at: 0)
        XCTAssertEqual(returnedTask, task)
    }
    
    //метод, который проверяет успешно ли удалены элементы из 2х массивов
    func testRemoveAllResultsCountsBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        
        //1 уходит в doneTask
        sut.checkTask(at: 0)
        sut.removeAll()
        
        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
    }
    
    // в массиве нужно чтоб хранились только уникальные значения
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))
        XCTAssertTrue(sut.tasksCount == 1)
    }
}
