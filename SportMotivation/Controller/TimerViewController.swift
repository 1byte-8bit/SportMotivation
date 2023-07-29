//
//  TimerViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 25.04.2022.
//

import UIKit
import SwiftUI

class TimerViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(text: "START WORKOUT", fontSize: 24, textColor: .spetialGray)
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeTimerWorkoutView), for: .touchUpInside)
        
        return button
    }()
    
    private let timerLabel: UILabel = {
        let timer = UILabel()
        timer.text = "1:30"
        timer.textColor = .spetialGray
        timer.font = .robotoMedium(size: 50)
        timer.translatesAutoresizingMaskIntoConstraints = false
        
        return timer
    }()
    
    private let timerCircle: UIImageView = {
        let timerCircle = UIImageView()
        timerCircle.image = UIImage(named: "timerCircle")
        timerCircle.translatesAutoresizingMaskIntoConstraints = false
        
        return timerCircle
    }()
    
    let shape = CAShapeLayer()
    let trackShapes = CAShapeLayer()
    let centerShape = CAShapeLayer()
    
    lazy var finishButton: UIButton = {
        let finishButton = UIButton(type: .system)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(.white, for: .normal)
        finishButton.titleLabel?.font = .robotoMedium18()
        finishButton.backgroundColor = .spetialGreen
        finishButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        finishButton.layer.cornerRadius = 10
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        
        return finishButton
    }()
    
    private let detailsLabel = UILabel(text: "Details", fontSize: 15, textColor: .spetialBrown)
    private let timerView = TimerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 4 + 20)
        let circlePath = UIBezierPath(arcCenter: center,
                                      radius: 113,
                                      startAngle: -.pi / 2,
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 18
        shape.strokeColor = UIColor.spetialGreen.cgColor
        shape.fillColor = UIColor.init(white: 0, alpha: 0).cgColor
        shape.strokeEnd = 0
        shape.lineCap = .round
        
        setupViews()
        setConstraints()
        
    }
    
    private func setupViews() {

        view.backgroundColor = .spetialBackground
        view.addSubview(timerCircle)
        view.layer.addSublayer(shape)
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(timerLabel)
        view.addSubview(detailsLabel)
        view.addSubview(timerView)
        view.addSubview(finishButton)
    }
    
    @objc func startTimer() {
        // Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
    
    func present() {
        present(self, animated: true)
    }
    
    @objc private func closeTimerWorkoutView() {
        print("close")
        dismiss(animated: true)
    }
    
}


extension TimerViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 4 + 20)
        ])
        
        NSLayoutConstraint.activate([
            timerCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerCircle.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 4 + 20)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.topAnchor.constraint(equalTo: timerCircle.bottomAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timerView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 7),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            finishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
