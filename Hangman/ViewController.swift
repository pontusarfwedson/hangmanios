//
//  ViewController.swift
//  Hangman
//
//  Created by Student on 10/26/16.
//  Copyright © 2016 PontusArfwedson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hintText: UITextField!
    @IBOutlet weak var wordText: UITextField!
    @IBOutlet weak var triesTxt: UITextField!
    var gameOn = true
    var correctChars = 0
    
    let testWord : String = "Tomato"
    let testHint : String = "Its red and in salads"
    
    var guessWord = ""
    var guessHint = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Implement reading this from file
        
        
        
        
        
        
        guessWord = testWord
        guessHint = testHint+". Number of letters: "+String(guessWord.characters.count)
        
        hintText.text = guessHint
        
        
        //Initialize empty
        var testString : String = ""
        for _ in 1...guessWord.characters.count{
            testString = testString + "_"
        }
        wordText.text = testString

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func letterClick(_ sender: UIButton) {
        
        if gameOn {
        
        var tries : Int = Int(triesTxt.text!)!
        tries = tries - 1
        if tries <= 0{
            triesTxt.text = "Game Over!"
            wordText.text = guessWord
            gameOn = false
        }else{
            triesTxt.text = String(tries)
            let lettertxt = sender.currentTitle!.lowercased()
            var ctr : Int = 0
            
            var text = wordText.text!
            //var newWordTxt = ""
           for i in guessWord.lowercased().characters{
                
                if i == lettertxt[lettertxt.startIndex]{
                    
                    correctChars = correctChars + 1
                    let index = text.index(text.startIndex, offsetBy: ctr)
                    let indexRemove = text.index(text.startIndex, offsetBy: (ctr+1))
                    text.insert(i, at: index)
                    print("Counter =" + String(ctr))
                    print("text len = " + String(text.characters.count))
                    if ctr < text.characters.count-2{
                    text.remove(at: indexRemove)
                    }else{
                        let indRem = text.index(text.endIndex, offsetBy: -1)
                        text.remove(at: indRem)
                    }
                    }
                ctr = ctr+1
                    
                }
            wordText.text = text
            
            if correctChars >= guessWord.characters.count{
                triesTxt.text = "YOU WON!"
                gameOn = false
            }
            
            
            }
        
        
        
            
        }
    }

    @IBAction func restartGame(_ sender: AnyObject) {
        var testString : String = ""
        for _ in 1...guessWord.characters.count{
            testString = testString + "_"
        }
        wordText.text = testString
        triesTxt.text = "10"
        correctChars = 0
        gameOn = true
    }
}

