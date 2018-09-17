//
//  Library.swift
//  Video Game Library
//
//  Created by Gabriela Torres on 9/13/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation

class Library {
    var gamesArray : [Game] = [Game(title: "Spiderman"), Game(title: "2k19"), Game(title: "Fortnite"), Game(title:"GTA: Skyrim Edition")]
    
    func addGame() {
        //Prompt user to enter tilte for new game to be added
        print("Please enter the title of the game you would like to add:")
        //Get title input from user and store in a variable
        var newGameTitle = readLine()
        //Check and make sure the input isn’t nil or an empty string
        while newGameTitle == nil || newGameTitle == ""{
            print("Ivalid title. Enter a valid title.")
            newGameTitle = readLine()
        }
        //Instatantiate a new game with thr title from user input
        let newGame = Game(title: newGameTitle!)
        //Add new game objet to our game array.
        gamesArray.append(newGame)
    }
    func listAvailableGames() {
        for game in gamesArray {
            if game.checkIn {
                print(game.title)
            }
        }
    }
    func removeGame() {
        //List all of our game titles with a number for the user to select
        for index in 0..<gamesArray.count {
            print("\(index).\(gamesArray[index].title)")
        }
        print("Please enter the name you want to revome:")
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<gamesArray.count)
        
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gamesArray.remove(at: userInput!)
    }
    func checkOutGame() {
        //Loop through our game array and print index and title if game is availiable to be checked out
        for index in 0..<gamesArray.count {
            if gamesArray[index].checkIn == true {
                print("\(index).\(gamesArray[index].title)")
            }
        }
        print("Please enter the number of the game you want to check out:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        //Change the checkedIn value of our game element at the index provided by the user
        gamesArray[userInput!].checkIn = false
        //Use calender to add time and establish dueDate
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        gamesArray[userInput!].dueDate = dueDate
        //Use dateformat to print out date as a readable string for the user
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        print("The game is due on: \(dateFormatter.string(from: dueDate!))")
    }
    func checkInGame() {
        //Loop through array of games and print checked out games in the index
        for index in 0..<gamesArray.count {
            if gamesArray[index].checkIn == false {
                print("\(index).\(gamesArray[index].title)")
            }
        }
        print("Please enter the number of the game you want to check in:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gamesArray[userInput!].checkIn = true
        //Remove the due date since the game has been returned
        gamesArray[userInput!].dueDate = nil 
    }
    func listUnavailableGames() { //Checking for unavalible games in the game library
        for game in gamesArray {
            if !game.checkIn {
                print(game.title)
                if let dueDate = game.dueDate{
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
}









