//
//  StatisticUIView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 12.04.2022.
//

import UIKit

class StatisticView: UIView {
    
    private let exercises = ["Biceps", "PullUps", "PushUps", "Squats", "Triceps"]
    
//    let testLabel = UILabel(text: "Hi", fontSize: 29)
    
    private let statisticLabel: UILabel = {
        let statisticLabel = UILabel()
        
        statisticLabel.text = "STATISTIC"
        statisticLabel.font = .robotoMedium24()
        statisticLabel.textColor = .spetialGray
        statisticLabel.adjustsFontSizeToFitWidth = true
        statisticLabel.minimumScaleFactor = 0.5
        statisticLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return statisticLabel
    }()
    
    private lazy var weekMonthControl: UISegmentedControl = {
        let items = ["Неделя", "Месяц"]
        let control = UISegmentedControl(items: items)
        
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .spetialDarkYellow
        control.backgroundColor = .spetialGreen
        let font = UIFont.robotoMedium16()
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.white],
                                       for: .normal)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font as Any,
                                        NSAttributedString.Key.foregroundColor: UIColor.spetialGray],
                                       for: .selected)
        control.setTitle("Неделя", forSegmentAt: 0)
        control.setTitle("Месяц", forSegmentAt: 1)
        control.translatesAutoresizingMaskIntoConstraints = false
        
        control.addTarget(self, action: #selector(selectedChacge), for: .valueChanged)
        
        return control
    }()
    
    private let exercisesLabel: UILabel = {
        let exercisesLabel = UILabel()
        
        exercisesLabel.text = "Exercises"
        exercisesLabel.font = .robotoMedium(size: 14)
        exercisesLabel.textColor = .spetialGray
        exercisesLabel.adjustsFontSizeToFitWidth = true
        exercisesLabel.minimumScaleFactor = 0.5
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return exercisesLabel
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
//        tableView.separatorStyle = .none
        tableView.separatorColor = .spetialGray
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 11)
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idStatisticTableCell = "idStatisticTableCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(statisticLabel)
        addSubview(weekMonthControl)
        addSubview(exercisesLabel)
        addSubview(tableView)
        tableView.register(StatisticTableViewCell.self,
                           forCellReuseIdentifier: idStatisticTableCell)
    }
    
    // Assign this class as a delegate
    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func selectedChacge() {
        if weekMonthControl.selectedSegmentIndex == 0 {
            print("week")
        } else {
            print("Month")
        }
    }
    
}

//MARK: - Data Source
extension StatisticView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idStatisticTableCell,
                                                       for: indexPath) as? StatisticTableViewCell
        else { return UITableViewCell() }
        
        cell.setExercisesName(name: exercises[indexPath.row])
        
        return cell
    }
}

//MARK: - Delegate
extension StatisticView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}


extension StatisticView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            statisticLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            weekMonthControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 40),
            weekMonthControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weekMonthControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: weekMonthControl.bottomAnchor, constant: 20),
            exercisesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}
