//
//  TimerView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 30.04.2022.
//

import UIKit

class RepsView: UIView {
    
    private let trainingNameTextLabel = UILabel(text: "Biceps", fontSize: 24, textColor: .spetialGray)

    private let setTextLabel = UILabel(text: "Sets", fontSize: 18, textColor: .spetialGray)
    private let setsLabel = UILabel(text: "1/4", fontSize: 24, textColor: .spetialGray)
    private let repsOfSetTextLabel = UILabel(text: "Reps", fontSize: 18, textColor: .spetialGray)
    private let repsOfSetLabel = UILabel(text: "1 min 30 sec", fontSize: 24, textColor: .spetialGray)
    
    private let setUnderLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .spetialGray
        line.layer.opacity = 0.3
        
        return line
    }()
    
    private let timeUnderLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .spetialGray
        line.layer.opacity = 0.3
        
        return line
    }()
    
    private let pencilEditingImage: UIImageView = {
        let timerCircle = UIImageView()
        timerCircle.image = UIImage(named: "pencil")
        timerCircle.translatesAutoresizingMaskIntoConstraints = false
        
        return timerCircle
    }()
    
    private let editingImage: UIImageView = {
        let timerCircle = UIImageView()
        timerCircle.image = UIImage(named: "editing")
        timerCircle.translatesAutoresizingMaskIntoConstraints = false
        
        return timerCircle
    }()
    
    private var editingStackView = UIStackView()
    
    lazy var nextSetButton: UIButton = {
        let nextSetButton = UIButton(type: .system)
        nextSetButton.setTitle("NEXT SET", for: .normal)
        nextSetButton.titleLabel?.font = .robotoMedium16()
        nextSetButton.setTitleColor(UIColor.spetialDarkGreen, for: .normal)
        nextSetButton.backgroundColor = .spetialDarkYellow
        nextSetButton.layer.cornerRadius = 10
//        timerButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        nextSetButton.translatesAutoresizingMaskIntoConstraints = false

        return nextSetButton
    }()
    
    
    private var setsStackView = UIStackView()
    private var repsOfSetStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .spetialLightBrown
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        addSubview(trainingNameTextLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setTextLabel,
                                                       setsLabel],
                                     axis: .horizontal,
                                     spacing: 100)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setUnderLine)
        
        repsOfSetStackView = UIStackView(arrangedSubviews: [repsOfSetTextLabel,
                                                            repsOfSetLabel],
                                     axis: .horizontal,
                                     spacing: 80)
        repsOfSetStackView.distribution = .equalSpacing
        addSubview(repsOfSetStackView)
        addSubview(timeUnderLine)
        
        editingStackView = UIStackView(arrangedSubviews: [pencilEditingImage,
                                                          editingImage],
                                       axis: .horizontal,
                                       spacing: 5)
        addSubview(editingStackView)
        addSubview(nextSetButton)
        
    }

}


extension RepsView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            trainingNameTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            trainingNameTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: trainingNameTextLabel.bottomAnchor, constant: 20),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            setUnderLine.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setUnderLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setUnderLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            repsOfSetStackView.topAnchor.constraint(equalTo: setUnderLine.bottomAnchor, constant: 20),
            repsOfSetStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsOfSetStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            timeUnderLine.topAnchor.constraint(equalTo: repsOfSetStackView.bottomAnchor, constant: 10),
            timeUnderLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timeUnderLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timeUnderLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            editingStackView.topAnchor.constraint(equalTo: timeUnderLine.bottomAnchor, constant: 10),
            editingStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editingStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nextSetButton.topAnchor.constraint(equalTo: editingStackView.bottomAnchor, constant: 30),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextSetButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


