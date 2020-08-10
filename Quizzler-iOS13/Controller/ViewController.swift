//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



var timer=Timer()

class ViewController: UIViewController {
    
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var trueVutton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar:UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress=0
        updateUI()
    }
    
    var quiz=QuizBrain()
    
    
    @IBAction func result(_ sender: UIButton) {
        let userAnswer=sender.currentTitle!
        
        let answer:Bool = quiz.checkAnswer(userAnswer)
        
         if(answer)
        {
            sender.backgroundColor=UIColor.green
            
        }
        else
        {
            sender.backgroundColor=UIColor.red
        }
        
        progressBar.progress=quiz.getProgress()
        userScore.text=" Score : \(quiz.getScore())"
        
        timer=Timer.scheduledTimer(timeInterval:0.2,target:self,selector: #selector(updateUI) , userInfo:nil,repeats:true )
  



            
    }
    
    @objc func updateUI()
    {
        let result:String = quiz.getQuestion()
        if(result == "thank you")
        {
            falseButton.alpha=0
            trueVutton.alpha=0
        }
        questionText.text=result
        
        
        falseButton.backgroundColor=UIColor.clear
        trueVutton.backgroundColor=UIColor.clear
        
        timer.invalidate()
    }
    
}

