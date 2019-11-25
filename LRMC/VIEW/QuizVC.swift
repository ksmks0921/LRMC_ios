//
//  ViewController.swift
//  LRMC
//
//  Created by Marko Dreher on 1/3/19.
//  Copyright © 2019 Marko Dreher. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {

    @IBOutlet weak var quizLabel: UILabel!
    
    @IBOutlet weak var yesBtn: UIButton!
    
    @IBOutlet weak var noBtn: UIButton!
    
    var quizList: [String] = []
    
    var loopNum: Int = 0
    
    var yesNum: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        yesBtn.clipsToBounds = true
        yesBtn.layer.borderColor = UIColor.white.cgColor
        yesBtn.layer.borderWidth = 1
        yesBtn.layer.cornerRadius = 4
        
        noBtn.clipsToBounds = true
        noBtn.layer.borderColor = UIColor.white.cgColor
        noBtn.layer.borderWidth = 1
        noBtn.layer.cornerRadius = 4
        loadQuizData()
        
    }
    
    func loadQuizData() {
        let quiz1 = "1. Are you over 6 months of age?"
        let quiz2 = "2. Have you had a severe allergic reaction to the flu shot prior?"
        
        let quiz3 = "3. Do you have a serious egg allergy?"
        
        let quiz4 = "4. Are you over 60 years old?"
        
        let temp = [quiz1] + [quiz2] + [quiz3]
        self.quizList = temp + [quiz4]
        
        self.quizLabel.text = quiz1
    }

    @IBAction func noEvent(_ sender: Any) {
        
        if(self.loopNum < 3){
            if(loopNum == 0){
                yesNum += 1
            }
            self.loopNum += 1
            self.quizLabel.text = self.quizList[loopNum]

        }
        else{
            
            if(self.yesNum != 0){
                self.quizLabel.text = "You should not get a flue vaccine"
            }
            else{
                self.quizLabel.text = "You should get a flue vaccine"
            }
            self.yesBtn.isHidden = true
            self.noBtn.isHidden = true
        }
    }
    
    @IBAction func yesEvent(_ sender: Any) {
        
        if(self.loopNum < 3){
            if(loopNum == 1 || loopNum == 2){
                    self.yesNum += 1
            }
            self.loopNum += 1
            self.quizLabel.text = self.quizList[loopNum]
            
            
        }else{
            if(self.yesNum != 0){
                self.quizLabel.text = "You should not get a flue vaccine"
            }
            else{
                self.quizLabel.text = "You should get a flue vaccine"
            }
            self.yesBtn.isHidden = true
            self.noBtn.isHidden = true
        }

    }
}

