//
//  CallendarCollectionViewCell.swift
//  FirstApp05.04
//
//  Created by Alexandr on 10.04.2022.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    private let dayOfWeekLabel: UILabel = {
        
        let label = UILabel()
        label.text = "W"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let numberOfDayLabel: UILabel = {
        
        let label = UILabel()
        label.text = "09"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .robotoMedium20()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 6
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .spetialYellow
                dayOfWeekLabel.textColor = .spetialBlack
                numberOfDayLabel.textColor = .spetialDarkGreen
            } else {
                backgroundColor = .spetialGreen
                dayOfWeekLabel.textColor = .white
                numberOfDayLabel.textColor = .white
            }
        }
    }
    
    
    private func setupViews() {
        addSubview(dayOfWeekLabel)
        addSubview(numberOfDayLabel)
    }
    
    private func cellConfigure(numberOfDay: String, dayOfWeek: String) {
        dayOfWeekLabel.text = dayOfWeek
        numberOfDayLabel.text = numberOfDay
    }
    
    
    public func dateForCell(numberOfDay: String, dayOfWeek: String) {
        cellConfigure(numberOfDay: numberOfDay, dayOfWeek: dayOfWeek)
    }
    
}

extension CalendarCollectionViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dayOfWeekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            dayOfWeekLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            numberOfDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            numberOfDayLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
}
