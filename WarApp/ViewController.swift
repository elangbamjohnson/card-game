//
//  ViewController.swift
//  WarApp
//
//  Created by Elangbam, Johnson (J.) on 08/02/19.
//  Copyright © 2019 Elangbam, Johnson (J.). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var cpuLabel: UILabel!
    @IBOutlet weak var dealButton: UIButton!
    @IBOutlet var bestOf: [UILabel]!
    
    var playerScore = 0
    var cpuScore = 0
    var bestOfDeal = 5
    var dealCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for label in bestOf {
            label.text = "Best of \(bestOfDeal)"
        }
       
    }

    @IBAction func dealClicked(_ sender: Any) {
        dealCount += 1
        dealButton.setTitle("\(dealCount)", for: .normal)
        
        if dealCount <= bestOfDeal {
            cardDealing()
        }else if dealCount > bestOfDeal {
            cardReset()
        }
    }
    
    
    func cardDealing() {
        let random1 = Int.random(in: 2..<14)
        let random2 = Int.random(in: 2..<14)
        let card1 = "card\(random1)"
        let card2 = "card\(random2)"
        leftImageView.image = UIImage(named:"\(card1)")
        rightImageView.image = UIImage(named: "\(card2)")
        playerLabel.text = "\(playerScore)"
        cpuLabel.text = "\(cpuScore)"
        
        if random1 > random2 {
            playerScore += 1
            playerLabel.text = "\(playerScore)"
        }else if random2 > random1 {
            cpuScore += 1
            cpuLabel.text = "\(cpuScore)"
        }
        if dealCount == bestOfDeal {
            var winner = playerScore > cpuScore ? "Human Wins!":"CPU Wins!"
            if playerScore == cpuScore {  winner = "DRAW" }
            for label in bestOf {
                label.text = "\(winner)"
            }
        }
        
    }
    
    func cardReset()  {
        dealCount = 0
        playerScore = 0
        cpuScore = 0
        playerLabel.text = "\(playerScore)"
        cpuLabel.text = "\(cpuScore)"
        dealButton.setTitle("\(dealCount)", for: .normal)
        leftImageView.image = UIImage(named:"back")
        rightImageView.image = UIImage(named:"back")
        
        for label in bestOf {
            label.text = "Best of \(bestOfDeal)"
        }
    }
}

