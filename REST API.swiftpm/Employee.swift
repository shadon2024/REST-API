//
//  Employee.swift
//  REST API
//
//  Created by Admin on 30/04/24.
//

import Foundation


struct Employee: Hashable, Decodable {
    let id: Int
    let emloyee_name: String
    let emloyee_salary: Int
    //let emloyee_age: Int
}

struct Query: Decodable {
    let status: String
    let data: [Employee]
}



extension Employee {
    static let example = Employee(id: 1, emloyee_name: "Rizoev Shodon", emloyee_salary: 3000)
}
