//
//  BusSignUp.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/16/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//

import Alamofire


// store sign-up information in a class

class BusSignUp {
    
    var first_name: String
    var last_name: String
    var pass_number: String
    
    init(_ first_name: String, _ last_name: String, _ pass_number: String) {
        self.first_name = first_name
        self.last_name = last_name
        self.pass_number = pass_number
    }
    
    
    func testServerConnection() -> String? {
        var ret: String = "No response"
        
        Alamofire.request("http://127.0.0.1:5000/").responseJSON { response in
            // make sure no errors
            guard response.result.error == nil else {
                // this runs if there is an error
                print("Error on response from server")
                // print error code
                print(response.result.error!)
                return
            }
            
            guard let json = response.result.value as? [String: Any] else {
                // didn't get a string object from server
                print("Did not receive string from server")
                return
            }
            
            guard let res = json["test"] as? String else {
                print("error 3")
                return
            }
            
            ret = res
        }
        
        return ret
        
    }


}

