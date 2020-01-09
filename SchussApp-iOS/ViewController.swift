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
    @IBOutlet weak var day_of_week: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTodayInfo()
    }
    
    
    
    //MARK: Actions
    func getTodayInfo() {
        day_of_week.text = getDayOfWeek()
    }
    
    
    func getDayOfWeek() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        let day: String = formatter.string(from: date)
        return day
    }
    
}
