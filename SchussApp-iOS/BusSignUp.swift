//
//  BusSignUp.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/16/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//

import UIKit


let response_codes: [Int: String] = [
    0: "Success!",
    1: "Invalid information.",
    2: "You are already on the bus list.",
    3: "No Response."
]


//MARK: CLASS BUSSIGNUP
// store sign-up information in a class
class BusSignUp {
    
    var first_name: String
    var last_name: String
    var pass_number: String
    var location: String
    
    var server_response: Int = 3
    
    
    init(_ first_name: String, _ last_name: String, _ pass_number: String, _ location: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.pass_number = pass_number
        self.location = location
    }
    
    
    
    
    //MARK: Submit
    public func submit() {
        
        let credentials = Credentials(self.first_name, self.last_name, self.pass_number, self.location)
        guard let uploadData = try? JSONEncoder().encode(credentials) else {
            return
        }
        
        let sem = DispatchSemaphore(value: 0);
        
        let url = URL(string: "http://127.0.0.1:5000/signup")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            do {
                //here dataResponse received from a network request
                if let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String: Any] {
                    //print(jsonResponse!) //Response result
                    let message = jsonResponse["status"] as! Int
                    self.server_response = message
                    sem.signal()
                }
                
            } catch let parsingError {
                print("Error", parsingError)
                return
            }
            
        }
        task.resume()
        sem.wait()
        return
    }
    
    
    
    //MARK: Test
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
                    if let message = jsonResponse["status"] as? Int {
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



//MARK: STRUCT CREDENTIALS
struct Credentials: Codable {
    var first_name: String
    var last_name: String
    var pass_number: String
    var location: String
    
    init(_ first_name: String, _ last_name: String, _ pass_number: String, _ location: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.pass_number = pass_number
        self.location = location
    }
}
