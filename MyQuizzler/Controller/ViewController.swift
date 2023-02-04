//
//  ViewController.swift
//  MyQuizzler
//
//  Created by Smolya on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    
   var quizBrain = QuizBrain ()
    
    // функция просмотра
    // блок кода, который отвечает за первое представление
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text // True or false
        let userGotItRight = quizBrain.checkAnswer(userAnswer!)
    
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false )

    }
    //Обновление UI
    @objc func updateUI (){
        questionLabel.text = quizBrain.getQuestionText ()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProcess ()
        scoreLabel.text = "Score: \(quizBrain.getScore ())"
        
    
        
    }
}

