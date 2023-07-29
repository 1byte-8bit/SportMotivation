//
//  WorkoutTableViewCell.swift
//  FirstApp05.04
//
//  Created by Alexandr on 11.04.2022.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    private let backgroundCell: UIView = {
        let bgView = UIView()
        bgView.layer.cornerRadius = 0
        bgView.backgroundColor = .spetialBackground
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        return bgView
    }()
    
    private var exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.textColor = .spetialBlack
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let beforeLabel: UILabel = {
        let label = UILabel()
        label.text = "Before: 10"
        label.textColor = .spetialGray
        label.font = .robotoMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let nowLabel: UILabel = {
        let label = UILabel()
        label.text = "Now: 2"
        label.textColor = .spetialGray
        label.font = .robotoMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let resultsLabel: UILabel = {
        let label = UILabel()
        label.text = "+4"
        label.textColor = .spetialGreen
        label.font = .robotoMedium(size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var labelsStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .red
        selectionStyle = .none
        
        addSubview(backgroundCell)
        addSubview(exerciseNameLabel)
        
        labelsStackView = UIStackView(arrangedSubviews: [beforeLabel,
                                                       nowLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(labelsStackView)
        addSubview(resultsLabel)
    }
    
    func setExercisesName(name: String) {
        exerciseNameLabel.text = name
    }
    
}


extension StatisticTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            exerciseNameLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            exerciseNameLabel.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: exerciseNameLabel.bottomAnchor, constant: 10),
            labelsStackView.leadingAnchor.constraint(equalTo: backgroundCell.leadingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
//            resultsLabel.topAnchor.constraint(equalTo: backgroundCell.topAnchor, constant: 5),
            resultsLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            resultsLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -10),
        ])
    }
    
}
