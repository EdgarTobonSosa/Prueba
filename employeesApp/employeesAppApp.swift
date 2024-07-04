//
//  employeesAppApp.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import SwiftUI

@main
struct employeesAppApp: App {
    var body: some Scene {
        WindowGroup {
            EmployeDetailView(employeDetailVM: EmployeeDetailViewModel(idEmployee: "1"))
        }
    }
}
