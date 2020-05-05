//
//  ViewController.swift
//  Project2
//
//  Created by Arnaud Balma on 4/30/20.
//  Copyright © 2020 Arnaud Balma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia",
                      "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        //button3.layer.borderColor = UIColor(red: 211, green: 211, blue: 211, alpha: 1.0).cgColor
        askQuestion()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showScore))
    }

    func askQuestion(_ action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " (Score: \(score))"
        questionCount += 1
    }
    
    @objc func showScore(){
        let myAlert = UIAlertController(title:"Your score", message: "Your score is \(score)", preferredStyle: .alert)
        
        myAlert.addAction(UIAlertAction(title: "Ok, got it", style: .default, handler: nil))
        
        present(myAlert, animated: true)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title:String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "✅✅✅"
            score += 1
            message = "Your score is \(score)"
        } else {
            title = "❌❌❌"
            score -= 1
            message = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
        }
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if questionCount == 10 {
            ac.title = "Final Score"
        }
        else{
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        //ac.addAction(UIAlertAction(title: "Destroy", style: .destructive, handler: askQuestion))
        //ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: askQuestion))
        }
        present(ac, animated: true)
    }
    
}

