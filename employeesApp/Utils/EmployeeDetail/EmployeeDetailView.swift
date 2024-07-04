//
//  EmployeeDetailView.swift
//  employeesApp
//
//  Created by Edgar Tobón Sosa on 04/07/24.
//

import Foundation

@MainActor
class EmployeeDetailViewModel: ObservableObject {
    let idEmployee: String

    
    @Published var state: State = .idle
    @Published var employee = [Employee]()
    init(idEmployee: String) {
        self.idEmployee = idEmployee
    }
    
    func obtainEmployeeDetail() {
        self.state = .loading
        Task {
            let response = await EmployeeDetailDataService.makeRequest(employeeID:idEmployee)
            
            guard let employee = try? response.get() else {
                guard case .failure(let error) = response else {
                    self.state = .error
                    return
                }
                switch error {
                case .emptyEmployees:
                    self.state = .error
                    return
                case .generic:
                    self.state = .error
                    return
                }
            }
            self.employee.append(employee.data)
            self.state = .loaded
            
        }
    }
    
}



class EmployeeDetailDataService {
    
    static func makeRequest(employeeID: String) async -> Result<DetailEmployeeResponse, employeeDomainError> {
        
        let url = EndPoint.make(baseUrl: "http://dummy.restapiexample.com/api/v1/employee", end:  employeeID)
        
        guard let url = url else {
            return .failure(.generic)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let employeResponse = try JSONDecoder().decode(DetailEmployeeResponse.self, from: data)
            return.success(employeResponse)
           }catch{
               return.failure(.generic)
           }
    }
    
}

class EndPoint {
    static func make(baseUrl: String, end: String) -> URL?{
        let fullPath:String = "\(baseUrl)/\(end)"
        guard let url:URL = URL(string: fullPath) else {
            return nil
        }
        return url
    }
}

