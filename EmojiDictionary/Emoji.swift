//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import Foundation

class Emoji: Codable {
    var  symbol: String
    var name: String
    var description: String
    var usage: String
    
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
    
    static func loadSampleEmojis() -> [Emoji]{
        var emojis = [
        Emoji(symbol:"😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something"),
        Emoji(symbol: "🐱", name: "Cat face", description: "A yellow cat", usage: "lovely mood"),
        Emoji(symbol: "🥑", name: "Avocado", description: "A green avocado", usage: "healthy food"),
        Emoji(symbol: "🚗", name: "Car", description: "red car", usage: "moving"),
        Emoji(symbol: "🚥", name: "Traffic light", description: "horizontal traffic light", usage: "to control traffic"),
        Emoji(symbol: "💊", name: "Pill", description: "red and yellow pill", usage: "when you fill bad"),
        Emoji(symbol: "🏆", name: "trophy", description: "big trophy", usage: "when you win sth"),
        Emoji(symbol: "⛰", name: "mountain", description: "hight mountain", usage: "for trip"),
        Emoji(symbol: "❤️", name: "Heart", description: "Red heart", usage: "for love"),
        Emoji(symbol: "📕", name: "Textbook", description: "Red textbook", usage: "to write sth"),
        Emoji(symbol: "📝", name: "memo", description: "Memo with pencil", usage: "sth to note")
        ]
        return emojis
    }
    
    
    
    
    
    
    
    
    static func saveToFile(emojis: [Emoji]){
        let propertyListEncoder = PropertyListEncoder()
        
        
        print(Emoji.archiveURL)
        
        
        let encodeEmojis = try? propertyListEncoder.encode(emojis)
        try? encodeEmojis?.write(to: archiveURL, options: .noFileProtection)
        
        
    }
    
    static func loadFromFile() -> [Emoji]{
        let propertyListDecoder = PropertyListDecoder()
        if let retriveEmojisData = try? Data(contentsOf: archiveURL), let decodedEmojis = try? propertyListDecoder.decode(Array<Emoji>.self, from: retriveEmojisData)
        
        {
            return  decodedEmojis
            
        }
        return []
    }
    init(symbol: String, name: String, description: String, usage:String){
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
