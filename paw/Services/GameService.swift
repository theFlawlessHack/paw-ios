//  Created by Jessica Joseph on 5/14/18.
//  Copyright © 2018 TFH. All rights reserved.

import Foundation

class GameService {
    static let instance = GameService()
    
    public private(set) var gameCount: Int = 0
    public private(set) var userWins: Int = 0
    public private(set) var computerWins: Int = 0
    
    func userWin() {
        self.userWins += 1
        self.gameCount += 1
    }
    
    func computerWin() {
        self.computerWins += 1
        self.gameCount += 1
    }
    
    func draw() {
        self.gameCount += 1
    }
    
    func resetGame() {
        self.gameCount = 0
        self.userWins = 0
        self.computerWins = 0
    }
}
