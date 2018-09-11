//
//  Menu.swift
//  Video Game Library
//
//  Created by Gabriela Torres on 9/11/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import Foundation


class Menu {
    var shouldQuit = false //When this is true, we should quit running the video game library.
    func go() { //This function will handle making the menu right. It will display the menu and take user input until the user wishes to quit the application.
        while !shouldQuit {
            printMenu()
            quit()
        }
    }
    func printMenu() {
        print("Select one of the options below:")
        print("""
1. Add Game
2. Remove Game
3. List Available Games
4. Check Out Game
5. Check In Game
6. List Check Out Games
7. Quit
""")
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

