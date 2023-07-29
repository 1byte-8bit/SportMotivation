//
//  UIFont+Extensions.swift
//  FirstApp05.04
//
//  Created by Alexandr on 09.04.2022.
//

import UIKit

extension UIFont {
    
    static func robotoMedium12() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 12)
    }
    
    static func robotoMedium15() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 15)
    }
    
    static func robotoMedium16() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 16)
    }
    
    static func robotoMedium18() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 18)
    }
    
    static func robotoMedium20() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 20)
    }
    
    static func robotoMedium22() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 22)
    }
    
    static func robotoMedium24() -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: 24)
    }
    
    static func robotoMedium(size: Int) -> UIFont? {
        return UIFont.init(name: "Roboto-Medium", size: CGFloat(size))
    }
}
