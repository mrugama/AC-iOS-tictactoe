//  RulesTicTacToe.swift
//  TicTacToe

//  Created by C4Q on 10/19/17.
//  Copyright © 2017 C4Q. All rights reserved.

import Foundation
import UIKit

class TicTacButton: UIButton {
    @IBInspectable var row: Int = 1
    @IBInspectable var col: Int = 1
}

class TicTacToeRules {
    //Each possible combination to win
    let winnerMov = [[(1,1),(1,2),(1,3)],
                    [(2,1),(2,2),(2,3)],
                    [(3,1),(3,2),(3,3)],
                    [(1,1),(2,1),(3,1)],
                    [(1,2),(2,2),(3,2)],
                    [(1,3),(2,3),(3,3)],
                    [(1,1),(2,2),(3,3)],
                    [(3,1),(2,2),(1,3)]]
    var player: ([(Int,Int)],[(Int,Int)]) = ([],[])
    enum Turn: String { //Player turns control
        case One = "X"
        case Two = "O"
        mutating func toggle() { //method to switch player
            switch self {
            case .One:
                self = .Two
            case .Two:
                self = .One
            }
        }
    }
    //Method saves player's movements
    func playerMovement(turn: Turn,userMov: (Int,Int)) {
        switch turn {
        case .One:
            player.0.append(userMov)
        case .Two:
            player.1.append(userMov)
        }
    }
    //Method, player has won?
    func isWinner(turn: Turn) -> Bool {
        let userPlay = turn == .One ? player.0: player.1
        var matches = 0, colum = 0
        for position in winnerMov {
            for win in position where colum < 3 {
                for play in userPlay {
                    if play == win {
                        matches += 1
                        if matches == 3 {
                            return true
                        }
                    }
                }
                colum += 1
            }
            colum = 0
            matches = 0
        }
        return matches == 3 ? true : false
    }
}


