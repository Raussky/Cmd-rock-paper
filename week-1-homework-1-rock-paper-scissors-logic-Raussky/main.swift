//
//  main.swift
//  Rock Paper Scissors
//
//  Created by Admin on 28.03.2023.
//

import Foundation

enum theGame: String {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
    init?(input: String) {
        switch input {
        case "rock":
            self = .rock
        case "paper":
            self = .paper
        case "scissors":
            self = .scissors
        default:
            return nil
        }
    }
}

protocol GameRules {
    func decideWinner(player1: theGame, player2: theGame) -> String
}

struct RockPaperScissors: GameRules {
    func decideWinner(player1: theGame, player2: theGame) -> String {
        if player1 == player2 {
            return "It's a draw!"
        } else if player1 == .rock && player2 == .scissors {
            return "Player 1 wins!"
        } else if player1 == .scissors && player2 == .paper {
            return "Player 1 wins!"
        } else if player1 == .paper && player2 == .rock {
            return "Player 1 wins!"
        } else {
            return "Player 2 wins!"
        }
    }
}

func getPlayer() -> theGame? {
    print("Enter your choice (rock, paper, or scissors): ")
    guard let input = readLine(), let game = theGame(input: input) else {
        print("Invalid input. Please try again.")
        return nil
    }
    return game
}



let game = RockPaperScissors()

while true {
    guard let player1 = getPlayer(), let player2 = getPlayer() else {
        break
    }
    let result = game.decideWinner(player1: player1, player2: player2)
    print(result)
}

