//
//  NetworkManager.swift
//  REST API
//
//  Created by Admin on 30/04/24.
//

//import Foundation
import SwiftUI

enum Link {
    
    case employees
    
    var url: URL {
        switch self {
        case .employees:
            return URL(string: "https://dummy.restapiexample.com/api/v1/employees")!
        }
    }
}


final class NetworkManager: ObservableObject {
    
    init() {}
    
    static let shared = NetworkManager()
    
    @Published var employees = [Employee]()
    
    
    
    func fetchEmployees() {
        
        //employees = [Employee.example]
        
        print("try to fetch")

        let fetchRequest = URLRequest(url: Link.employees.url)

        URLSession.shared.dataTask(with: fetchRequest )  { [weak self] (data, response, error) -> Void in

            if error != nil {

                print("Error in session is not nil")

            } else {
                // we have got data

                let httpResponse = response as? HTTPURLResponse
                print("status cod: \(String(describing: httpResponse?.statusCode))")

                guard let safeData = data else { return }

                if let decodeQuery = try? JSONDecoder().decode(Query.self, from: safeData) {
                    

                    DispatchQueue.main.async {
                        self?.employees = decodeQuery.data
                        print("ok")
                    }
                }
            }

        }.resume()

    }
}
