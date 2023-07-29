//
//  ProfileViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 29.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Place for properties
    
    private let profileLabel = UILabel(text: "PROFILE", fontSize: 24, textColor: .spetialGray)
    
    private let headerRectangleView: UIView = {
        let rectangle = UIView()
        rectangle.backgroundColor = .spetialGreen
        rectangle.layer.cornerRadius = 10
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        
        return rectangle
    }()
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "addUser")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    private let heightLabel = UILabel(text: "height: 178", fontSize: 15, textColor: .spetialBlack)
    private let weightLabel = UILabel(text: "weight: 70", fontSize: 15, textColor: .spetialBlack)
    
    private let editingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Editing", for: .normal)
        button.setBackgroundImage(UIImage(named: "editing_btn"), for: .normal)

        button.setTitleColor(UIColor.spetialGreen, for: .normal)
        button.titleColor(for: .normal)
        button.titleLabel?.font = .robotoMedium15()
        button.imageEdgeInsets = UIEdgeInsets(top: 0,
                                             left: 100,
                                             bottom: 0,
                                             right: 0)

        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    
    private var profileDataStackView = UIStackView()
    private var progressStackView = UIStackView()
    private let trainingCollectionView = TrainingsCollectionView()
    
    private let targetLabel = UILabel(text: "TARGET: 20 workouts", fontSize: 15, textColor: .spetialBlack)
    
    let shape = CAShapeLayer()
    
    private let progressBarPath: UIBezierPath = {
        let path = UIBezierPath()

        return path
    }()
    
    private let progressBar: CAShapeLayer = {
        let progress = CAShapeLayer()
        progress.lineWidth = 22
        progress.strokeColor = UIColor.spetialGreen.cgColor
        progress.fillColor = UIColor.spetialBrown.cgColor
        progress.strokeEnd = 10
        progress.lineCap = .round
        
        return progress
    }()
    
    private let progressBarBG: CAShapeLayer = {
        let progress = CAShapeLayer()
        progress.lineWidth = 22
        progress.strokeColor = UIColor.spetialBrown.cgColor
        progress.fillColor = UIColor.spetialBrown.cgColor
        progress.strokeEnd = 10
        progress.lineCap = .round
        
        return progress
    }()
    
    private let startProgress = UILabel(text: "2", fontSize: 25, textColor: .spetialBlack)
    private let endProgress = UILabel(text: "20", fontSize: 25, textColor: .spetialBlack)
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - Place for functions
    
    private func setupViews() {
        
        view.backgroundColor = .spetialBackground
        
        view.addSubview(profileLabel)
        view.addSubview(headerRectangleView)
        view.addSubview(userPhotoImageView)
        
        profileDataStackView = UIStackView(arrangedSubviews: [heightLabel,
                                                              weightLabel,
                                                              editingButton],
                                           axis: .horizontal,
                                           spacing: 20)
        profileDataStackView.distribution = .fillProportionally
        profileDataStackView.alignment = .fill
        
        view.addSubview(profileDataStackView)
        view.addSubview(trainingCollectionView)
        view.addSubview(targetLabel)
        
        progressStackView = UIStackView(arrangedSubviews: [startProgress,
                                                           endProgress
                                                           ],
                                        axis: .horizontal,
                                        spacing: 100)
//        progressStackView.distribution = .fillProportionally
        progressStackView.alignment = .fill
        
        view.addSubview(progressStackView)
        
        progressBarPath.move(to: CGPoint(x: 20, y: view.frame.height / 2 + view.frame.height / 4 + 70)) // StartPoint
        progressBarPath.addLine(to: CGPoint(x: 370, y: view.frame.height / 2 + view.frame.height / 4 + 70)) // EndPoint of First Line and StartPoint for Second Line
        
        progressBarBG.path = progressBarPath.cgPath
        view.layer.addSublayer(progressBarBG)
        
        let progressBarBGPath = UIBezierPath()
        progressBarBGPath.move(to: CGPoint(x: 20, y: view.frame.height / 2 + view.frame.height / 4 + 70))
        progressBarBGPath.addLine(to: CGPoint(x: 70, y: view.frame.height / 2 + view.frame.height / 4 + 70))
        
        progressBar.path = progressBarBGPath.cgPath
        view.layer.addSublayer(progressBar)

    }
    
}

//MARK: - Place to set constraints
extension ProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            headerRectangleView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor),
            headerRectangleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            headerRectangleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            headerRectangleView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            profileDataStackView.topAnchor.constraint(equalTo: headerRectangleView.bottomAnchor, constant: 10),
            profileDataStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            profileDataStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            profileDataStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            editingButton.widthAnchor.constraint(equalToConstant: 20),
            editingButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            trainingCollectionView.topAnchor.constraint(equalTo: profileDataStackView.bottomAnchor, constant: 20),
            trainingCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            trainingCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            trainingCollectionView.heightAnchor.constraint(equalToConstant: 260)
        ])
        
        NSLayoutConstraint.activate([
            targetLabel.topAnchor.constraint(equalTo: trainingCollectionView.bottomAnchor, constant: 20),
            targetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            progressStackView.topAnchor.constraint(equalTo: targetLabel.bottomAnchor, constant: 20),
            progressStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressStackView.heightAnchor.constraint(equalToConstant: 30)
        ])

    }
}
