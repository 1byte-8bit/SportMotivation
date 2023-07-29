//
//  StatisticViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 12.04.2022.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private let statisticView = StatisticView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .spetialBackground
        view.addSubview(statisticView)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StatisticViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statisticView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            statisticView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            statisticView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            statisticView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
