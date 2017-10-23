//  ViewController.swift
//  TicTacToe

//  Created by C4Q on 10/18/17.
//  Copyright © 2017 C4Q. All rights reserved.
import UIKit
class ViewController: UIViewController {
    var buttons: [TicTacButton] = []
    var playerTurn = TicTacToeRules.Turn.One //Turn of player
    var ticTacRules = TicTacToeRules() //Instance game's logic
    
    @IBOutlet weak var lblWinPlayer: UILabel!
    @IBOutlet weak var lblPlayerTurn: UILabel!
    @IBOutlet weak var btnOne: TicTacButton!
    @IBOutlet weak var btnTwo: TicTacButton!
    @IBOutlet weak var btnThree: TicTacButton!
    @IBOutlet weak var btnFour: TicTacButton!
    @IBOutlet weak var btnFive: TicTacButton!
    @IBOutlet weak var btnSix: TicTacButton!
    @IBOutlet weak var btnSeven: TicTacButton!
    @IBOutlet weak var btnEight: TicTacButton!
    @IBOutlet weak var btnNine: TicTacButton!
    //Once the game has loaded set scenario
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [btnOne, btnTwo,btnThree,
                   btnFour, btnFive, btnSix,
                   btnSeven, btnEight, btnNine]
        playerTurn = TicTacToeRules.Turn.One
        reset()
    }
    //Button: Reset Game
    @IBAction func btnReset(_ sender: UIButton) {
        reset()
    }
    //Player's button pressed
    @IBAction func btnPressed(_ sender: TicTacButton) {
        sender.setTitle(playerTurn.rawValue, for: .normal)
        sender.isEnabled = false
        playerRole(row: sender.row, col: sender.col)
    }
    //Fn to save mov. and check if user has won
    func playerRole(row: Int, col: Int) {
        ticTacRules.playerMovement(turn: playerTurn,userMov: (row, col))
        if ticTacRules.isWinner(turn: playerTurn) {
            lblWinPlayer.text = "Player \(playerTurn) Wins!"
            lblWinPlayer.isHidden = false
            view.backgroundColor = .black
            for btn in buttons {
                btn.isEnabled = false
            }
        } else {
            playerTurn.toggle()
            lblPlayerTurn.text = "Player \(playerTurn)'s Turn"
        }
    }
    //Fn to reset game
    func reset() {
        lblWinPlayer.isHidden = true
        playerTurn = .One
        lblPlayerTurn.text = "Player \(playerTurn)'s Turn"
        view.backgroundColor = .white
        for button in buttons {
            button.setTitle(" ", for: .normal)
            button.isEnabled = true
            ticTacRules.player = ([],[])
        }
    }
}

