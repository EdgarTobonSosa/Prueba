//
//  EmployeeListView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI


struct EmployeeListView: View {
    @StateObject var emplyeListVM = EmployeeListViewModel()
    var body: some View {
        EmployeeListViewPreview(
            employees: emplyeListVM.employees , stateSevice: emplyeListVM.state, action: {emplyeListVM.ObtainEmployes()})
    }
}

struct EmployeeListViewPreview: View {
    let employees: [Employee]
    let stateSevice: StateService
    let action: () -> ()
    
    var body: some View {
        
        switch stateSevice {
        case .idle:
            Text("")
                .onAppear{
                    action()
                }
            
        case .loading:
            Text("Loading...")
        case .loaded:
            ForEach(employees) { employee in
                EmployeeCard(employee: employee)
                    
                    .cardStyle()
            }
            .padding([.leading,.trailing], 15)
        case .error:
            Text("Error")
        }
       
    }
}

#Preview {
    EmployeeListViewPreview(employees: [
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: ""),
        Employee(id: 122342343, name: "Edgar Tobón Sosa", salary: 10000, age: 25, image: "")
    ],
                            stateSevice: .loaded,
                            action: {}
    )
}


