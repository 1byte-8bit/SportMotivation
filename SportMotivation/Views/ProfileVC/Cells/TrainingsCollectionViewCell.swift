//
//  ProfileTrainingsCollectionViewCell.swift
//  FirstApp05.04
//
//  Created by Alexandr on 18.06.2022.
//

import UIKit

class TrainingsCollectionViewCell: UICollectionViewCell {
    
    private let testLabel: UILabel = {
        
        let label = UILabel()
        label.text = "We"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .spetialGreen
        layer.cornerRadius = 20
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(testLabel)
    }
    
}

extension TrainingsCollectionViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            testLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            testLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
}
