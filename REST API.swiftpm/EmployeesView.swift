//
//  EmloyeesView.swift
//  REST API
//
//  Created by Admin on 30/04/24.
//

import SwiftUI

struct EmployeesView: View {
    
    @StateObject var networkManager = NetworkManager()
    
    //@State private var employees = [Employee]()
    
    var body: some View {
        
        ZStack {
            
            List(networkManager.employees , id: \.self) { employee in
                HStack{
                    Text(employee.emloyee_name)
                    Spacer()
                    Text(employee.emloyee_salary, format: .number)
                }
            }
        
        }
        .onAppear {
            networkManager.fetchEmployees()
        }
    }
}



struct EmployeesView_Previews: PreviewProvider {
        static var previews: some View {
            EmployeesView()
        }
}


