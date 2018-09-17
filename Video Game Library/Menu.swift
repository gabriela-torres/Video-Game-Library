//
//  Menu.swift
//  Video Game Library
//
//  Created by Gabriela Torres on 9/11/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation


class Menu {
    let gameLibrary = Library()
    var shouldQuit = false //When this is true, we should quit running the video game library.
    func go() { //This function will handle making the menu right. It will display the menu and take user input until the user wishes to quit the application.
        while !shouldQuit {
            printMenu()
            var input = getInput()
            while !validateInput(input) {
                printMenu()
                input = getInput()
            }
            handleInput(input)
        }
    }
    func validateInput(_ input: String) -> Bool {
        let validMenuOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
    }
    func printMenu() {
        //This should contain a print statement that prints out a formatted list of options.
        print("Select one of the options below:\n")
        print("""
1. Add Game
2. Remove Game
3. List Available Games
4. Check Out Game
5. Check In Game
6. List Checked Out Games
7. Print Menu
8. Quit

Please enter a number between 1 and 8:\n
""")
    }
    //Make a function called handleInput that takes our user input as a parameter and depending on what they enter print out what we would do.
    func handleInput(_ input: String) {
        switch input {
        case "1":
            //Call the libray's add game function
            gameLibrary.addGame()
        case "2":
            //Call the libray's remove game function
            gameLibrary.removeGame()
        case "3":
            //Call the libray's list avalible game function
            gameLibrary.listAvailableGames()
        case "4":
            //Call the libray's Check Out Game function
            gameLibrary.checkOutGame()
        case "5":
            //Call the libray's Check In Game function
            gameLibrary.checkInGame()
        case "6":
            //Call the libray's List Checked Out Game function
            gameLibrary.listUnavailableGames()
        case "7":
            //Call print menu
            printMenu()
        case "8":
            //Call the libray's Quit function
            quit()
        default:
            break
        }
    }
    func quit() { //This function will be called when the user is ready to quit the application.
        //Since the user is ready to quit, set shouldQuit = true
        shouldQuit = true
        //Show user a message
        print("Thank you for using the application.")
    }
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
}

