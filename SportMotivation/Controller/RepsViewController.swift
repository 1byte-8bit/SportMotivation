//
//  TimerViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 25.04.2022.
//

import UIKit

protocol presentView {
    func present()
}

class RepsViewController: UIViewController {
    private let startWorkoutLabel = UILabel(text: "START WORKOUT", fontSize: 24, textColor: .spetialGray)
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeRepsWorkoutView), for: .touchUpInside)
        
        return button
    }()
    
    private let trainingImage: UIImageView = {
        let timerCircle = UIImageView()
        timerCircle.image = UIImage(named: "training")
        timerCircle.translatesAutoresizingMaskIntoConstraints = false
        
        return timerCircle
    }()
    
    private let detailsLabel = UILabel(text: "Details", fontSize: 15, textColor: .spetialBrown)
    private let timerView = RepsView()
    
    lazy var finishButton: UIButton = {
        let finishButton = UIButton(type: .system)
        finishButton.setTitle("FINISH", for: .normal)
        finishButton.setTitleColor(.white, for: .normal)
        finishButton.titleLabel?.font = .robotoMedium18()
        finishButton.backgroundColor = .spetialGreen
        finishButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        finishButton.layer.cornerRadius = 10
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        
        return finishButton
    }()
    
//    private let editingWorkoutAlert = UIAlertController(title: "My Alert",
//                                                   message: "This is an alert.",
//                                                   preferredStyle: .alert)
//    private let alertAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
    
//    var delegate: StartButtonDelegate = self
    
    let editingAlert = EditingAlert()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
    }
    
    func present() {
        present(self, animated: true)
    }
    
    private func setupViews() {

        view.backgroundColor = .spetialBackground
        view.addSubview(trainingImage)

        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(detailsLabel)
        view.addSubview(timerView)
        view.addSubview(finishButton)
        
//        editingWorkoutAlert.addAction(alertAction)
    }
    
    @objc func startTimer() {
//        self.present(editingWorkoutAlert, animated: true)
        editingAlert.showAlert(title: "LIKE", message: "JI", viewController: self)
    }
    
    @objc private func closeRepsWorkoutView() {
        print("close")
        dismiss(animated: true)
    }
    
}


extension RepsViewController {
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
            trainingImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trainingImage.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 4 + 20),
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailsLabel.topAnchor.constraint(equalTo: trainingImage.bottomAnchor, constant: 20),
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

