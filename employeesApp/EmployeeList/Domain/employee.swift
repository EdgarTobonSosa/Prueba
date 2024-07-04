//
//  employee.swift
//  employeesAppTests
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

struct EmployeeResponse: Codable {
    let status: String
    let data: [Employee]
    let message: String
    
    enum CodignKeys: String, CodingKey {
        case status, data, message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodignKeys.self)
        
        self.status = try container.decode(String.self, forKey: .status)
        self.data = try container.decode([Employee].self, forKey: .data)
        self.message = try container.decode(String.self, forKey: .message)
    }
}

struct Employee: Codable, Identifiable {
    let id: Int
    let name: String
    let salary: Int
    let age: Int
    let image: String
    
    enum CodignKeys: String,CodingKey {
        case id = "id"
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case image = "profile_image"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodignKeys.self)
        
        self.id  = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.salary = try container.decode(Int.self, forKey: .salary)
        self.age = try container.decode(Int.self, forKey: .age)
        self.image = try container.decode(String.self, forKey: .image)
    }
    
    init(id: Int, name: String, salary: Int, age: Int, image: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
        self.image = image
    }
}
