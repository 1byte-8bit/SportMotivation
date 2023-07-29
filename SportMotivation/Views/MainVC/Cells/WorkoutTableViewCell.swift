//
//  WorkoutTableViewCell.swift
//  FirstApp05.04
//
//  Created by Alexandr on 11.04.2022.
//

import UIKit

protocol ShowViews {
    func showTimerView()
    func showRepsView()
}


class WorkoutTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 20
        bgView.backgroundColor = .spetialBrown
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        return bgView
    }()
    
    private let workoutBackgroundView: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 20
        bgView.backgroundColor = .spetialBackground
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        return bgView
    }()
    
    private var workoutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        // add image
        imageView.tintColor = .black
//        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Pull Ups"
        label.textColor = .spetialBlack
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let workoutRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps: 10"
        label.textColor = .spetialGray
        label.font = .robotoMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let workoutSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets: 2"
        label.textColor = .spetialGray
        label.font = .robotoMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .spetialYellow
        button.tintColor = .spetialDarkGreen
        button.addShadowOnView()
        button.layer.cornerRadius = 10
        button.setTitle("START", for: .normal)
        button.tintColor = .spetialDarkGreen
        button.titleLabel?.font = .robotoMedium(size: 16)

        
        button.translatesAutoresizingMaskIntoConstraints = false
        // Action
        button.addTarget(self,
                         action: #selector(startButtonTapped),
                         for: .touchUpInside
        )
        
        if button.isSelected == true {
            button.backgroundColor = .spetialGreen
        } else {
            button.backgroundColor = .spetialYellow
        }
        
        return button
    }()
    
    var labelsStackView = UIStackView()
    
    static var delegate: ShowViews?
    var isTimer: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .spetialBackground
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(workoutBackgroundView)
        workoutBackgroundView.addSubview(workoutImageView)
        addSubview(workoutNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [workoutRepsLabel,
                                                       workoutSetsLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(labelsStackView)
        contentView.addSubview(startButton)
    }
    
    func setimage(image: UIImage) {
        workoutImageView.image = image
    }
    
    func setTitle(name: String) {
        workoutNameLabel.text = name
    }
    
    func setReps(reps: Int) {
        workoutRepsLabel.text = String(reps)
    }
    
    func setSets(sets: Int) {
        workoutSetsLabel.text = String(sets)
    }
    
    func setTypeOfTraining(_ type: Bool) {
        isTimer = type
    }
    
    
    //MARK: - Button action
    @objc private func startButtonTapped() {
        print("startButtonTapped")
        if isTimer {
            WorkoutTableViewCell.delegate?.showTimerView()  // WorkoutTableViewCell
        } else {
            WorkoutTableViewCell.delegate?.showRepsView()
        }
        

        if startButton.isSelected == true {
            startButton.backgroundColor = .spetialGreen
            startButton.tintColor = .spetialGreen
        } else {
            startButton.backgroundColor = .spetialYellow
        }
    }
    
}

//override var isSelected: Bool {
//    didSet {
//        if self.isSelected {
//            backgroundColor = .spetialYellow
//            dayOfWeekLabel.textColor = .spetialBlack
//            numberOfDayLabel.textColor = .spetialDarkGreen
//        } else {
//            backgroundColor = .spetialGreen
//            dayOfWeekLabel.textColor = .white
//            numberOfDayLabel.textColor = .white
//        }
//    }
//}

extension WorkoutTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
                
        NSLayoutConstraint.activate([
            workoutBackgroundView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            workoutBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutBackgroundView.heightAnchor.constraint(equalToConstant: 70),
            workoutBackgroundView.widthAnchor.constraint(equalToConstant: 70)
        ])
                
        NSLayoutConstraint.activate([
            workoutImageView.topAnchor.constraint(equalTo: workoutBackgroundView.topAnchor, constant: 10),
            workoutImageView.leadingAnchor.constraint(equalTo: workoutBackgroundView.leadingAnchor, constant: 10),
            workoutImageView.trailingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: -10),
            workoutImageView.bottomAnchor.constraint(equalTo: workoutBackgroundView.bottomAnchor, constant: -10)
        ])
                
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            workoutNameLabel.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10)
        ])
                
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 0),
            labelsStackView.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            labelsStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
                
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 5),
            startButton.leadingAnchor.constraint(equalTo: workoutBackgroundView.trailingAnchor, constant: 10),
            startButton.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
