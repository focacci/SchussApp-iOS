//
//  SignUp_ViewController.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 12/19/19.
//  Copyright © 2019 Schussmeisters Ski Club. All rights reserved.
//

import UIKit

class SignUp_ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var response_text: UILabel!
    
    @IBOutlet weak var first_name: UITextField!
    @IBOutlet weak var last_name: UITextField!
    @IBOutlet weak var pass_number: UITextField!
    @IBOutlet weak var location: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    //MARK: Actions
    @IBAction func signUpClicked(_ sender: UIButton) {
        let first: String = self.first_name.text!
        let last: String = self.last_name.text!
        let pass: String = self.pass_number.text!
        let loc: String  = self.location.titleForSegment(at: self.location.selectedSegmentIndex)!
        
        let sign_up = BusSignUp(first, last, pass, loc)

        sign_up.submit()

        response_text.text = response_codes[sign_up.server_response]
        
        if (sign_up.server_response == 0) {
            
            self.dismiss(animated: false, completion: {})
        }
    }
    
    
}
