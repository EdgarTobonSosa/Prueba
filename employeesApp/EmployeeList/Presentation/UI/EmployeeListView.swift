//
//  EmployeeListView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct EmployeeListView: View {
    let employees: [Employee]
    var body: some View {
        ForEach(employees) { employee in
            EmployeeCard(employee: employee)
                
                .cardStyle()
        }
        .padding([.leading,.trailing], 15)
    }
}

#Preview {
    EmployeeListView(employees: [
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: "")
    ])
}


