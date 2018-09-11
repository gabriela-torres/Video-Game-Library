//
//  Game Class.swift
//  Video Game Library
//
//  Created by Gabriela Torres on 9/10/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

class Game {
    let title: String
    var genre: String
    var description: String
    var checkIn: Bool = true
    var dueDate: Date?
    
    init(title: String, genre:String, description: String, checkIn: Bool, dueDate: Date?) {
        self.title = title
        self.genre = genre
        self.description = description
        self.dueDate = dueDate
    }
}
