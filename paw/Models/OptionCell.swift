//
//  OptionCell.swift
//  paw
//
//  Created by Jessica Joseph on 5/14/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

protocol OptionCellProtocol {
    func userPlayedGame(userWin: Bool, draw: Bool)
}

class OptionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    let PAPER = "paper"
    let ROCK = "rock"
    let SCISSORS = "scissors"
    
    var computerSelection: String = ""
    var delegate: OptionCellProtocol!
    var draw: Bool = false
    var userSelection: String = ""
    var userWin: Bool = false
    
    @IBAction func userAttack(_ sender: UIButton) {
         print(userSelection, computerSelection)
        
        switch (userSelection, computerSelection) {
        case (ROCK, PAPER):
            GameService.instance.computerWin()
            break
        case (ROCK, SCISSORS):
            GameService.instance.userWin()
            userWin = true
            break
        case (ROCK, ROCK):
            GameService.instance.draw()
            draw = true
            break
        case (SCISSORS, PAPER):
            GameService.instance.userWin()
            userWin = true
            break
        case (SCISSORS, SCISSORS):
            GameService.instance.draw()
            draw = true
            break
        case (SCISSORS, ROCK):
            GameService.instance.computerWin()
            break
        case (PAPER, PAPER):
            GameService.instance.draw()
            draw = true
            break
        case (PAPER, SCISSORS):
            GameService.instance.computerWin()
            break
        case(PAPER, ROCK):
            GameService.instance.userWin()
            userWin = true
            break
        default:
            break
        }
        self.delegate.userPlayedGame(userWin: userWin, draw: draw)
    }
}
