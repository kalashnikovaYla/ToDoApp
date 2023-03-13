//
//  Location.swift
//  ToDoApp
//
//  Created by sss on 08.03.2023.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

// Equatable - без этого не получится сравнить структуры с простым свойством let name: String
// если бы здесь было больше свойств со стандартными типами, то они также будут сравниваться по умолчанию

extension Location: Equatable {
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        guard rhs.coordinate?.latitude == lhs.coordinate?.latitude && rhs.coordinate?.longitude == lhs.coordinate?.longitude && lhs.name == rhs.name else {return false}
        return true
    }
}
