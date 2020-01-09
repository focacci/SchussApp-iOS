//
//  Mountains.swift
//  SchussApp-iOS
//
//  Created by Michael Focacci on 1/6/20.
//  Copyright © 2020 Schussmeisters Ski Club. All rights reserved.
//

import UIKit


// 0 All day
// 1 Night
let schedule: [String: [Int: [String]]] = [
    "Sunday":       [0: ["Peak N Peak", "Swain"]],
    "Monday":       [1: ["Holiday Valley"]],
    "Tuesday":      [0: ["Kissing Bridge"]],
    "Wednesday":    [0: ["Kissing Bridge"]],
    "Thursday":     [0: ["Peak N Peak"], 1: ["Holiday Valley"]],
    "Friday":       [0: ["Swain"], 1: ["Holiday Valley"]],
    "Saturday":     [1: ["Kissing Bridge"]]
]
