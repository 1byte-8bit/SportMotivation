//
//  UILabel+Extensions.swift
//  FirstApp05.04
//
//  Created by Alexandr on 14.04.2022.
//

import UIKit


extension UILabel {
    convenience init(text: String = "", fontSize: Int = 14, textColor: UIColor = .spetialBrown){
        self.init()
        self.font = .robotoMedium(size: fontSize)
        self.textColor = textColor
        self.text = text
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
