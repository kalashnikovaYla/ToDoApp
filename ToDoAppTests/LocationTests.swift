//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by sss on 08.03.2023.
//

import XCTest
import CoreLocation
@testable import ToDoApp

final class LocationTests: XCTestCase {

    func testInitSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(coordinate.latitude, location.coordinate?.latitude)
        XCTAssertEqual(coordinate.longitude, location.coordinate?.longitude)
    }

}
