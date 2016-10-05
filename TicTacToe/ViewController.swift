//
//  ViewController.swift
//  TicTacToe
//
//  Created by Salomon Pluviose on 10/3/16.
//  Copyright © 2016 Salomon Pluviose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: AnyObject) {
        
        thePlayer = 1
        
        activeGame = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }
    
    // thePlayer: 1 is drake, 2 is kanye
    
    var thePlayer = 1
    
    var activeGame = true
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombinations = [[0,4,8], [1,4,7], [2,4,6], [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8]]
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
         print("button pressed!")
        print(sender.tag)
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = thePlayer
            
            if thePlayer == 1 {
                sender.setImage(UIImage(named: "drake.png"), for: [])
                
                thePlayer = 2
            } else {
                sender.setImage(UIImage(named: "kwh4.png"), for: [])
                
                thePlayer = 1
            } // end of if statement
            

            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    // the winner
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Drizzy Gave you The Business"
                    } else {
                        winnerLabel.text = "It Aint Ralph Though - Kanye"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    })
                    
                    
                }
        
            }
            
            
        }
        
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

