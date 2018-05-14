//  Created by Jessica Joseph on 5/14/18.
//  Copyright © 2018 TFH. All rights reserved.

import UIKit

class ChallengeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var attackButton: UIButton!
    
    var computerAttackOptions = ["rock", "paper", "scissors"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ChallengeController: UICollectionViewDataSource, UICollectionViewDelegate, OptionCellProtocol
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return computerAttackOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "optionCell", for: indexPath) as! OptionCell
        cell.imageView.image = UIImage(named: computerAttackOptions[indexPath.row])
        cell.userSelection = computerAttackOptions[indexPath.row]
        cell.computerSelection = computerAttackOptions[Int(arc4random_uniform(UInt32(computerAttackOptions.count)))]
        cell.delegate = self 
        return cell
    }
    
    func userPlayedGame(userWin: Bool, draw: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "settings") as! SettingsController
        
        controller.draw = draw
        controller.userWin = userWin
        present(controller, animated: true, completion: nil)
    }
}

