//
//  BusSignUp.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/16/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//




// store sign-up information in a class

class BusSignUp {
    
    var first_name: String
    var last_name: String
    var pass_number: Int
    
    init(_ first_name: String, _ last_name: String, _ pass_number: Int) {
        self.first_name = first_name
        self.last_name = last_name
        self.pass_number = pass_number
    }
    
    
    func send_to_server() {
        print("Sending to server")
    }


}

