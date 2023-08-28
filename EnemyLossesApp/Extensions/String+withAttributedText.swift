//
//  String+withAttributedText.swift
//  EnemyLossesApp
//
//  Created by user on 27.08.2023.
//

import UIKit

extension String {
    
    func withAttributedText(text: String, fontSize: CGFloat? = nil, weight: UIFont.Weight, color: UIColor? = nil) -> NSAttributedString {
        
        let fullString = NSMutableAttributedString(string: self)
        let range = (self as NSString).range(of: text)
        
        if let fontSize = fontSize {
            fullString.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)], range: range)
        }
        
        
        if let textColor = color {
            fullString.addAttributes([NSAttributedString.Key.foregroundColor: textColor], range: range)
        }
        
        return fullString
    }
}

