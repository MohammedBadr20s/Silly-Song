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

shortNameForName(name: "Mohammed")