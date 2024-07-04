//
//  EmployeDetailView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

struct EmployeDetailView: View {
    let employee: Employee
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("ID: \(String(employee.id))")
                    .font(.system(size: 24,weight: .bold))
                    .padding(.bottom)
                
                HStack {
                    Text(employee.name)
                    Spacer()
                    Text (String(employee.age))
                    
                }
                .font(.system(size: 24,weight: .bold))
                .foregroundStyle(Color.gray)
            }
            .padding(.bottom, 40)
            
            Text ("$\(String(employee.salary))")
                .font(.system(size: 24,weight: .bold))
                .foregroundStyle(Color.green)
        }
            
        
    }
}

#Preview {
    EmployeDetailView(employee: Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""))
}
