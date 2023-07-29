//
//  NewProfileViewController.swift
//  FirstApp05.04
//
//  Created by Alexandr on 24.05.2022.
//

import UIKit

class NewProfileViewController: UIViewController {
    
    //MARK: - Place for properties
    
    private let editingProfileLabel = UILabel(text: "EDITING PROFILE", fontSize: 24, textColor: .spetialGray)
    
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
    
    private let firstNameLabel = UILabel(text: "First Name", fontSize: 15, textColor: .spetialBrown)
    
    private let firstNameTextField = UITextField(backgroundColor: .spetialBrown,
                                                 textColor: .spetialGray,
                                                 fontSize: 20)
//    firstNameTextField.leftView = .always
    
    private let secondNameLabel = UILabel(text: "Second Name", fontSize: 15, textColor: .spetialBrown)
    
    private let secondNameTextField = UITextField(backgroundColor: .spetialBrown,
                                                 textColor: .spetialGray,
                                                 fontSize: 20)
    
    private let heightLabel = UILabel(text: "Height", fontSize: 15, textColor: .spetialBrown)
    
    private let heightTextField = UITextField(backgroundColor: .spetialBrown,
                                              textColor: .spetialGray,
                                              fontSize: 20,
                                              keyboardType: .numberPad)
    
    private let weightLabel = UILabel(text: "Weight")
    
    private let weightTextField = UITextField(backgroundColor: .spetialBrown,
                                              textColor: .spetialGray,
                                              fontSize: 20,
                                              keyboardType: .numberPad)
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .spetialGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveProfile), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
//        print(#function)
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear()")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews()")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewWillAppear()")
    }
    
    //MARK: - Place for functions
    
    private func setupViews() {
        view.backgroundColor = .spetialBackground
        
        view.addSubview(editingProfileLabel)
        view.addSubview(headerRectangleView)
        view.addSubview(userPhotoImageView)
        view.addSubview(firstNameLabel)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameLabel)
        view.addSubview(secondNameTextField)
        view.addSubview(heightLabel)
        view.addSubview(heightTextField)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(saveButton)
    }
    
    @objc private func saveProfile() {
        
    }
    
}

//MARK: - Place to set constraints
extension NewProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingProfileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            editingProfileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
            firstNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstNameLabel.topAnchor.constraint(equalTo: headerRectangleView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            firstNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 5),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            secondNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            secondNameTextField.topAnchor.constraint(equalTo: secondNameLabel.bottomAnchor, constant: 5),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            heightLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            heightTextField.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 5),
            heightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            weightLabel.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            weightTextField.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5),
            weightTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 50),
            saveButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
