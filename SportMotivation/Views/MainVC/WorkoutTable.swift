//
//  WorkoutTable.swift
//  FirstApp05.04
//
//  Created by Alexandr on 10.04.2022.
//

import UIKit
import RealmSwift

class WorkoutTable: UIView {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let idWorkoutTableCell = "idWorkoutTableCell"
    private let imageForCell = [
        UIImage(named: "biceps"),
        UIImage(named: "body"),
        UIImage(named: "dumbbell"),
        UIImage(named: "kettlebell"),
        UIImage(named: "timer")
    ]
    
    // Extract data from realm
    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    
    
    // Initialization View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        setsDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Setup View
    private func setupView() {
        backgroundColor = .none
//        layer.cornerRadius = 30
        
        addSubview(tableView)
        tableView.register(WorkoutTableViewCell.self,
                           forCellReuseIdentifier: idWorkoutTableCell)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Assign this class as a delegate
    private func setsDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getWorkoutArray() -> Results<WorkoutModel> {
        
        let workoutArray = localRealm.objects(WorkoutModel.self)
        
        return workoutArray
    }
    
    // ??????????
    func reloadTable() {
//        workoutModel = WorkoutModel()
        setupView()
    }
    
    func reloadTableData() {
        tableView.reloadData()
    }
    
}

//MARK: - Data Source
extension WorkoutTable: UITableViewDataSource {
    
//    let data = getData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let workoutArray = getWorkoutArray()
        return workoutArray.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let workoutArray = getWorkoutArray()
        let action = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            let deleteModel = workoutArray[indexPath.row]
            RealmManager.shared.deleteWorkoutModel(model: deleteModel)
            tableView.reloadData()
        }
        
        action.backgroundColor = .spetialBackground
        action.image = UIImage(named: "delete")
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idWorkoutTableCell,
                                                       for: indexPath) as? WorkoutTableViewCell
        else { return UITableViewCell() }

        let workoutArray = getWorkoutArray()
        print(workoutArray)
        
        guard let image = workoutArray[indexPath.row].workoutImage else { return UITableViewCell()}
        guard let tst = UIImage(data: image) else { return UITableViewCell() }
        
        if workoutArray[indexPath.row].workoutTimer != 0 {
            cell.setTypeOfTraining(true)
        }
        
        cell.setimage(image: tst)
        cell.setTitle(name: workoutArray[indexPath.row].workoutName)
        cell.setReps(reps: workoutArray[indexPath.row].workoutReps)
        cell.setSets(sets: workoutArray[indexPath.row].workoutSets)
        

        return cell
    }
}

//MARK: - Delegate
extension WorkoutTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension WorkoutTable {

    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }

}
