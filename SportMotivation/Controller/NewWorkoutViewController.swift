//
//  NewWorkoutViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 14.04.2022.
//

import UIKit


class NewWorkoutViewController: UIViewController {
    
    private let repsOrTimerLabel = UILabel(text: "Reps or timer", fontSize: 15, textColor: .spetialBrown)
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .spetialGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveNewWorkout), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let newWorkoutView = NewWorkoutView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repeatOrTimerView = RepeatsOrTimerView()
//    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    private let table = WorkoutTable()
    
//    private let workoutTable = WorkoutTable()
    private let mainViewController = MainViewController()
    
    private let workoutImage = UIImage(named: "biceps")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        addTaps()
        setupViews()
        setConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        refreshObjects()
    }
    
    
    private func setupViews() {
        view.backgroundColor = .spetialBackground
        view.addSubview(newWorkoutView)
        view.addSubview(dateAndRepeatView)
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repeatOrTimerView)
        view.addSubview(saveButton)
        
        newWorkoutView.closeButton.addTarget(self,
                                             action: #selector(closeWorkoutView),
                                             for: .touchUpInside
        )
    }
    
    private func setNewWorkoutData() {
        let workoutName = newWorkoutView.getNewWorkoutName()
        workoutModel.workoutName = workoutName
        
        let dateFromDatePicker = dateAndRepeatView.getDateValue()
        workoutModel.workoutDate = dateFromDatePicker
        workoutModel.workoutNumberOfDay = dateFromDatePicker.getWeekDayNumber()
        
        workoutModel.workoutRepeat = dateAndRepeatView.getWorkoutRepeatValue()
        
        workoutModel.workoutSets = repeatOrTimerView.getSlidersValues().0
        workoutModel.workoutReps = repeatOrTimerView.getSlidersValues().1
        workoutModel.workoutTimer = repeatOrTimerView.getSlidersValues().2
        
        guard let imageData = workoutImage?.pngData() else { return }
        workoutModel.workoutImage = imageData

    }
    
    private func saveData() {
        let text = newWorkoutView.getNewWorkoutName()
        let count = text.filter {$0.isNumber || $0.isLetter}.count
        
        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            
            // Save Model
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            // Revert Model
            workoutModel = WorkoutModel()
            
            // Alert
            alertOk(title: "Success!", messege: nil)
            
            // Refresh
            refreshObjects()
        } else {
            print("Error Lesson 5 - 00:18:27")
            alertOk(title: "Error", messege: "Enter all parametrs")
        }
        
    }
    
    private func refreshObjects() {
        newWorkoutView.refreshWorkoutName()
        dateAndRepeatView.refreshDatePickerAndSwitch()
        repeatOrTimerView.refreshLabelsAndSliders()
        table.reloadTable()
        table.reloadTableData()
        
//        workoutTable.reloadTable()
//        mainViewController.viewDidLoad()
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func saveNewWorkout() {
        print("Save Workout")
        setNewWorkoutData()
        saveData()
        refreshObjects()

//        RealmManager.shared.saveWorkoutModel(model: workoutModel)
    }
    
    @objc private func closeWorkoutView() {
        print("close")
        dismiss(animated: true)
        table.reloadTableData()
        mainViewController.reloadInputViews()
        
    }
    
}

extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            newWorkoutView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newWorkoutView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newWorkoutView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: newWorkoutView.bottomAnchor, constant: 0),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            repeatOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 5),
            repeatOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repeatOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repeatOrTimerView.heightAnchor.constraint(equalToConstant: 300),
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repeatOrTimerView.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
}
