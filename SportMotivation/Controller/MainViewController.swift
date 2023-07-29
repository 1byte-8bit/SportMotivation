//
//  ViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 05.04.2022.
//

import UIKit
import RealmSwift
import CoreLocation

class MainViewController: UIViewController {
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.text = "Prytkov Aleksandr"
        nameLabel.font = .robotoMedium24()
        nameLabel.textColor = .spetialGray
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    private lazy var addWorkoutButton: UIButton = {
        let workoutButton = UIButton(type: .system)
        workoutButton.backgroundColor = .spetialYellow
        workoutButton.layer.cornerRadius = 10
        workoutButton.setTitle("Add Workout", for: .normal)
        workoutButton.tintColor = .spetialDarkGreen
        workoutButton.titleLabel?.font = .robotoMedium12()
        workoutButton.setImage(UIImage(named: "+"), for: .normal)
        workoutButton.layer.masksToBounds = false
        // Edge
        workoutButton.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                     left: 20,
                                                     bottom: 15,
                                                     right: 0)
        workoutButton.titleEdgeInsets = UIEdgeInsets(top: 50,
                                                     left: -40,
                                                     bottom: 0,
                                                     right: 0)
        workoutButton.translatesAutoresizingMaskIntoConstraints = false
        // Action
        workoutButton.addTarget(self,
                                action: #selector(addWorkoutButtonTapped),
                                for: .touchUpInside
        )
        
        return workoutButton
    }()
    
    private let workoutLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout Today"
        label.textColor = .spetialGray
        label.font = .robotoMedium15()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.translatesAutoresizingMaskIntoConstraints = false
       
        return label
    }()
    
    
    //MARK: - Other View
    private let calendarView = CalendarView()
    private let weatherView = WeatherView()
    private let workoutTable = WorkoutTable()
    private var weatherManager = WeatherManager()
    
    private let localRealm = try! Realm()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getLocationData()
        setupViews()
        setConstraints()
        
        weatherManager.delegate = self
        WorkoutTableViewCell.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let workoutArray = localRealm.objects(WorkoutModel.self)
        workoutTable.reloadTableData()
    }

    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .spetialBackground
        
        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
        view.addSubview(weatherView)
        view.addSubview(workoutLabel)
        view.addSubview(workoutTable)
        
        weatherView.addShadowOnView()
        addWorkoutButton.addShadowOnView()
    }
    
    private func getTrainingData() {}
    
    private func getLocationData() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
        
    
    //MARK: - Button action
    @objc private func addWorkoutButtonTapped() {
        print("addWorkoutButtonTapped")
        let newWorkoutController = NewWorkoutViewController()
        newWorkoutController.modalPresentationStyle = .fullScreen
        newWorkoutController.modalTransitionStyle = .coverVertical
        present(newWorkoutController, animated: true)
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got Location data")
        print("Locations: \(locations)")
        print("Manager: \(manager)")
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
//            let speed = location.speed // meters per second
//            let alt = location.altitude
            
//            print("Lat: \(lat) Long: \(lon), Alt: \(alt), Floor: \(speed)")
            
            weatherManager.fetchData(lat: lat, lon: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

extension MainViewController: ShowViews {
    func showTimerView() {
        let timerViewController = TimerViewController()
        timerViewController.modalPresentationStyle = .fullScreen
        timerViewController.modalTransitionStyle = .coverVertical
        present(timerViewController, animated: true)
    }
    
    func showRepsView() {
        let repsViewController = RepsViewController()
        repsViewController.modalPresentationStyle = .fullScreen
        repsViewController.modalTransitionStyle = .coverVertical
        present(repsViewController, animated: true)
    }
}

extension MainViewController: WeatherManagerDelegate {
    
    func toDisplay(_ weather: WeatherModel) {
        print(weather.conditionName)
        print(weather.currentTime)
        print(weather.sunrise)
        DispatchQueue.main.async {
            self.weatherView.setTopWeatherLabel(weather.temperatureString)
            self.weatherView.setImage(weather.conditionName)
        }
    }
    
}

//MARK: - Set Constraints
extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -5),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 10),
            weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            weatherView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            workoutLabel.topAnchor.constraint(equalTo: addWorkoutButton.bottomAnchor, constant: 20),
            workoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            workoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            workoutTable.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: 10),
            workoutTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            workoutTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            workoutTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

