//
//  editingAlert.swift
//  FirstApp05.04
//
//  Created by Alexandr on 01.05.2022.
//

import UIKit

class EditingAlert: UIView {
    
    struct Constants {
        static let transparentBackground: CGFloat = 0.8
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        
        return view
    }()
    
    private let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .none
        image.image = UIImage(named: "girl")
        
        return image
    }()
    
    
    func showAlert(title: String, message: String, viewController: UIViewController) {
        guard let targetView = viewController.view else { return }
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40,
                                 y: -300,
                                 width: targetView.frame.width - 80,
                                 height: 300)
        
        targetView.addSubview(alertView)
        
        backgroundImage.frame = CGRect(x: 80,
                                       y: 120,
                                       width: alertView.frame.width,
                                       height: alertView.frame.height)
        
        targetView.addSubview(backgroundImage)
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = Constants.transparentBackground
        }
    }
    
}
