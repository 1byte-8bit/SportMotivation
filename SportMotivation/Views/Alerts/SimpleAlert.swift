//
//  SimpleAlert.swift
//  FirstApp05.04
//
//  Created by Alexandr on 04.05.2022.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, messege: String?) {
        
        let alert = UIAlertController(title: title,
                                      message: messege,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
        
    }
}
