//
//  DateAndRepeatView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 15.04.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dateTextLabel = UILabel(text: "Date", fontSize: 20, textColor: .spetialGray)
    private let dateLabel = UILabel(text: "15.04.2022", fontSize: 24, textColor: .spetialGray) // Реализовать
    
    lazy var dateField: UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        if #available(iOS 15, *) {
            date.minimumDate = .now
        } else {
            date.minimumDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())
        }
        date.tintColor = .spetialGreen
        date.addTarget(self, action: #selector(dueDateChanged), for: .valueChanged)
//        date.subviews[0].subviews[0].subviews[0].alpha = 0
        date.translatesAutoresizingMaskIntoConstraints = false

        return date
    }()
    
    private let repeatsLabel = UILabel(text: "Repeats every 7 days", fontSize: 18, textColor: .spetialGray)
    
    private let switchButton: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.onTintColor = .spetialGreen
        switchBtn.isOn = true
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        
        return switchBtn
    }()
    
    private var upStackView = UIStackView()
    private var downStackView = UIStackView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .spetialBrown
        layer.cornerRadius = 10
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        
        upStackView = UIStackView(arrangedSubviews: [dateTextLabel,
                                                     dateField],
                                  axis: .horizontal,
                                  spacing: 100)
        upStackView.distribution = .equalSpacing
        addSubview(upStackView)
        
        downStackView = UIStackView(arrangedSubviews: [repeatsLabel,
                                                       switchButton],
                                    axis: .horizontal,
                                    spacing: 100)
        downStackView.distribution = .equalSpacing
        addSubview(downStackView)
    }
    
    private func getDateAndRepeat() -> (Date, Bool) {
        return (dateField.date, switchButton.isOn)
    }
    
    private func refreshWorkoutObjects() {
        dateField.setDate(Date(), animated: true)
        switchButton.isOn = true
    }
    
    public func refreshDatePickerAndSwitch(){
        refreshWorkoutObjects()
    }
    
    private func setDateAndRepeat() -> (Date, Bool) {
        getDateAndRepeat()
    }
    
     @objc private func dueDateChanged() {
         print("due Date")
         let formatter = DateFormatter()
//         formatter.dateStyle = .short
         formatter.dateFormat = "d" // Only Day
         print(formatter.string(from: dateField.date))
    }
    
    public func getDateValue() -> Date {
        return dateField.date
    }
    
    public func getWorkoutRepeatValue() -> Bool {
        return switchButton.isOn
    }
    
}


extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            upStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            upStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            upStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            downStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            downStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            downStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
