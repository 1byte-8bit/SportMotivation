//
//  MainTabBarController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 14.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapBar()
        setupViews()
//        setConstraints()
    }
    
    private func setupTapBar() {
        tabBar.backgroundColor = .spetialTabBar
        tabBar.tintColor = .spetialDarkGreen
        tabBar.unselectedItemTintColor = .spetialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.spetialLightBrown.cgColor
//        tabBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupViews() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        let profileVC = ProfileViewController()
        
        setViewControllers([mainVC, statisticVC, profileVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Main"
        items[1].title = "Statistic"
        items[2].title = "Profile"
        
        items[0].image = UIImage(named: "main")
        items[1].image = UIImage(named: "statistic")
        items[2].image = UIImage(named: "profile")
        
        let font = UIFont.robotoMedium16()
        // For Normal Presentation
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                          NSAttributedString.Key.foregroundColor: UIColor.spetialGray
                                                          ],
                                                         for: .normal)
        // For Selected Presention
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                                          NSAttributedString.Key.foregroundColor: UIColor.spetialDarkGreen],
                                                         for: .selected)
    }
    
}

extension MainTabBarController {
    private func setConstraints(){
        NSLayoutConstraint.activate([

        ])
    }
}
