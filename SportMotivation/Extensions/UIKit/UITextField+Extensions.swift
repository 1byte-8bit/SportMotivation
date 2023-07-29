//
//  UITextField+Extensions.swift
//  FirstApp05.04
//
//  Created by Alexandr on 26.05.2022.
//

import UIKit


extension UITextField {
    convenience init(backgroundColor: UIColor = .spetialBrown,
                     textColor: UIColor = .spetialGray,
                     fontSize: Int = 20,
                     keyboardType: UIKeyboardType = .default) {
        self.init()
        self.backgroundColor = backgroundColor
        self.borderStyle = .none
        self.layer.cornerRadius = 10
        self.textColor = textColor
        self.font = .robotoMedium(size: fontSize)
        self.leftView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: 10,
                                             height: self.frame.height)
        )
        self.leftViewMode = .always
        self.clearButtonMode = .always
        self.returnKeyType = .done
        self.keyboardType = keyboardType
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
