//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by sss on 12.03.2023.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
    
   
    
    @IBAction func saveButton(_ sender: Any) {
        
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormatter.date(from: dateTextField.text!)
        let descriptionString = descriptionTextField.text
        let addressString = addressTextField.text
        
        // Здесь используется complition handler, в котором мы присваиваем нашему task manager новую задачу, комплишин отрабатывает не сразу,здесь на нужно соединение с интернетом, для того чтобы получить placemarks
        // поэтому когда в тесте мы обращаемся к нашему массиву, у нас еще задачи в массиве нету - поэтому краш
        // чтобы исключить наличие интернета нужно создать фейковый класс нашего геокодера
        geocoder.geocodeAddressString(addressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleString!, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
        }
    }
}
