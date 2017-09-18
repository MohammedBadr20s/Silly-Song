//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

func shortNameForName(name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aieou")
    
    if let index = lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound {
        return name.substring(from: index)
    }
    
    return ""
}

shortNameForName(name: "Menna")


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


print(lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Menna"))
