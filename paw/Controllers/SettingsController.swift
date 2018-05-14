//
//  SettingsController.swift
//  paw
//
//  Created by Jessica Joseph on 5/14/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var userWinCountLabel: UILabel!
    @IBOutlet weak var computerWinCountLabel: UILabel!
    @IBOutlet weak var gameCountLabel: UILabel!
    @IBOutlet weak var announcementLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var userWin: Bool = false
    var draw: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userWinCountLabel.text = String(GameService.instance.userWins)
        computerWinCountLabel.text = String(GameService.instance.computerWins)
        gameCountLabel.text = "GAME #\(String(GameService.instance.gameCount))"
        
        if userWin {
            announcementLabel.text = "USER WINS"
            mainImageView.image = UIImage(named: "win")
        } else if draw {
            announcementLabel.text = "DRAW"
            mainImageView.image = UIImage(named: "draw")
        } else {
            announcementLabel.text = "COMPUTER WINS"
            mainImageView.image = UIImage(named: "lose")
        }
        
        resetButton.layer.cornerRadius = resetButton.frame.size.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func resetGame(_ sender: Any) {
        GameService.instance.resetGame()
        performSegue(withIdentifier: "main", sender: self)
    }
}
