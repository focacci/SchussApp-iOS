//
//  ViewController.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/16/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var response_text: UILabel!
    
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var pass_number: UITextField!
    @IBOutlet weak var location: UISegmentedControl!
    
    @IBOutlet weak var sign_up: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }
    
    
    
    
    //MARK: Actions

    @IBAction func submit_credentials(_ sender: UIButton) {
        let first: String = self.first_name.text!
        let last: String = self.last_name.text!
        let pass: String = self.pass_number.text!
        let loc: String  = self.location.titleForSegment(at: self.location.selectedSegmentIndex)!
        
        let sign_up = BusSignUp(first, last, pass, loc)

        sign_up.submit()

        response_text.text = sign_up.server_response
    }
    
    
    
    @IBAction func test_server_connection(_ sender: UIButton) {
        let first: String = self.first_name.text!
        let last: String = self.last_name.text!
        let pass: String = self.pass_number.text!
        let loc: String  = self.location.titleForSegment(at: self.location.selectedSegmentIndex)!
        
        let sign_up = BusSignUp(first, last, pass, loc)

        sign_up.testServerConnection()

        response_text.text = sign_up.server_response
    }
    
}
