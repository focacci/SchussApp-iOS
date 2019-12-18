//
//  BusSignUp.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/16/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//

import UIKit


// store sign-up information in a class
class BusSignUp {
    
    var first_name: String
    var last_name: String
    var pass_number: String
    
    var server_response: String = "No response"
    
    
    init(_ first_name: String, _ last_name: String, _ pass_number: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.pass_number = pass_number
    }
    
    
    public func testServerConnection() {
        
        let url = URL(string: "http://127.0.0.1:5000/")
        let sem = DispatchSemaphore(value: 0);
        
        let _ = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            do {
                //here dataResponse received from a network request
                if let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String: Any] {
                    //print(jsonResponse!) //Response result
                    if let message = jsonResponse["status"] as? String {
                        self.server_response = message
                        sem.signal()
                    }
                }
                
            } catch let parsingError {
                print("Error", parsingError)
                return
            }

        }
        .resume()
        sem.wait()
        return
    }


}

