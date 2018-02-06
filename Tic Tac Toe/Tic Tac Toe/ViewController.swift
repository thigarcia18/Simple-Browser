//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Thiago Garcia on 08/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func btnPlayAgain(_ sender: Any) {
        
        activeGame = true
    
        activePlayer = 1
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            
            if let button = view.viewWithTag(i) as? UIButton {
                
                button.setImage(nil, for: [])
                
                winnerLabel.isHidden = true
                
                playAgainButton.isHidden = true
                
                winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
                
                playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
                
            }
            
        }
        
    }
    
    
    var activeGame = true
    
    // 1 bolinha, 2 xizinho
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - bolinha, 2 - xizinho
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    @IBAction func btnPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), for: [])
                
                activePlayer = 2
                
                
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), for: [])
                
                activePlayer = 1
                
            }
            
            for combinations in winningCombinations {
                
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                    
                    activeGame = false
                    
                    winnerLabel.isHidden = false
                    
                    playAgainButton.isHidden = false
                    
                    if gameState[combinations[0]] == 1 {
                        
                        winnerLabel.text = "Bolinha ganhou!"
                        
                    } else {
                        
                        winnerLabel.text = "Xizinho ganhou!"
                        
                    }
                    
                    UIView.animate(withDuration: 1.5, animations: {
                        
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                        
                        })
                    
                }
                
            }
            
        }
        
        print(sender.tag)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

