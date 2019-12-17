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
    @IBOutlet weak var first_name_test: UILabel!
    @IBOutlet weak var last_name_test: UILabel!
    @IBOutlet weak var pass_number_test: UILabel!
    
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var pass_number: UITextField!
    
    @IBOutlet weak var sign_up: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
    }
    
    //MARK: Actions
    @IBAction func collect_information(_ sender: UIButton) {
        let sign_up = BusSignUp(self.first_name.text!, self.last_name.text!, self.pass_number.text!)
        let response = sign_up.testServerConnection()
        first_name_test.text = response
        last_name_test.text = response
        pass_number_test.text = response
    }
    

}
