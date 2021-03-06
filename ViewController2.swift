//
//  ViewController.swift
//  Silly Song
//
//  Created by Mohammed Badr on 9/17/17.
//  Copyright © 2017 MBadr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self// Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        
    }

    @IBAction func displayLyrics(_ sender: Any) {
        let newtext: String = nameField.text!
        lyricsView.text.append(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: newtext))
        
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false;
    }
    
}



func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aieou")
    
    if let index = lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound {
        return name.substring(from: index)
    }
    
    return ""
}
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

