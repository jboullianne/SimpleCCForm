//
//  Constants.swift
//  SimpleCCForm
//
//  Created by Jean-Marc Boullianne on 10/27/19.
//

import UIKit
public class CardManager {
    
    public struct CardType {
        public var IINs:[String]
        public var lengths:[Int]
        public var name:String
        public var icon:UIImage?
    }
    
    static let Cards:[CardType] = [
        CardType(IINs: IINGenerator(ranges: [34...34, 37...37]), lengths: [15], name: "American Express", icon: nil),
        CardType(IINs: IINGenerator(ranges: [5610...5610, 560221...560225]), lengths: [16], name: "Bankcard", icon: nil),
        CardType(IINs: IINGenerator(ranges: [6011...6011, 622126...622925, 624000...626999, 628200...628899, 64...64, 65...65]), lengths: lengthGenerator(ranges: [16...19]), name: "Discover Card", icon: nil),
        CardType(IINs: IINGenerator(ranges: [4...4]), lengths: [16], name: "Visa", icon: nil),
        CardType(IINs: IINGenerator(ranges: [2221...2720, 51...55]), lengths: [16], name: "Mastercard", icon: nil)
    ]
    
    static func IINGenerator(ranges: [ClosedRange<Int>]) -> [String] {
        var IINs:[String] = []
        for range in ranges {
            for x in range {
                IINs.append("\(x)")
            }
        }
        return IINs
    }
    
    static func lengthGenerator(ranges: [ClosedRange<Int>]) -> [Int] {
        var lengths:[Int] = []
        
        for range in ranges {
            for x in range {
                lengths.append(x)
            }
        }
        return lengths
    }
    
    public static func calculateCardType(cardNumber: String) -> [CardType] {
        return Cards.filter({ (card) -> Bool in
            var match = false
            for IIN in card.IINs {
                if cardNumber.prefix(IIN.count) == IIN {
                    match = true
                }
            }
            return match
        })
    }
}

