//
//  Game Class.swift
//  Video Game Library
//
//  Created by Gabriela Torres on 9/10/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

//Game bass class
class Game {
    let title: String
    var checkIn: Bool = true
    var dueDate: Date?
    
    init(title: String) {
        self.title = title
    }
}
