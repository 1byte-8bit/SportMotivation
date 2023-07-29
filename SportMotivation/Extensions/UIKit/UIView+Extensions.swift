//
//  UIView+Extensions.swift
//  FirstApp05.04
//
//  Created by Alexandr on 09.04.2022.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
    }
    
}
