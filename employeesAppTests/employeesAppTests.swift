//
//  employeesAppTests.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import XCTest

@testable import employeesApp

final class employeesAppTests: XCTestCase {

    func test_salary_should_be_true_if_salary_is_grater_than_100(){
        
       //GIVEN
        let salary = 2000
        //THEN
        
       let capturedValue = salary > 1000
        //WHEN
        
        XCTAssertTrue(capturedValue)
    }

}
