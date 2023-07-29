//
//  NewWorkoutView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 15.04.2022.
//

import UIKit


class NewWorkoutView: UIView {
    
    private let newWorkoutLabel = UILabel(text: "NEW WORKOUT", fontSize: 24, textColor: .spetialGray)
    private let nameLabel = UILabel(text: "Name", fontSize: 15, textColor: .spetialBrown)
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(closeWorkoutView), for: .touchUpInside)
        
        return button
    }()
    
    let nameTextField: UITextField = {
        let nameField = UITextField()
        nameField.backgroundColor = .spetialBrown
        nameField.borderStyle = .none
        nameField.layer.cornerRadius = 10
        nameField.textColor = .spetialGray
        nameField.font = .robotoMedium20()
        nameField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 10,
                                                  height: nameField.frame.height)
        )
        nameField.leftViewMode = .always
        nameField.clearButtonMode = .always
        nameField.returnKeyType = .done
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        
        return nameField
    }()
    
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat", fontSize: 15, textColor: .spetialBrown)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDeligate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .none
        layer.masksToBounds = false
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(newWorkoutLabel)
        addSubview(closeButton)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(dateAndRepeatLabel)
    }
    
    private func refreshWorkoutObjects() {
        nameTextField.text = ""
    }
    
    public func refreshWorkoutName(){
        refreshWorkoutObjects()
    }
    
    private func setDeligate() {
        nameTextField.delegate = self
    }
    
    public func getNewWorkoutName() -> String {
        return nameTextField.text!
    }
    
    @objc private func closeWorkoutView() {
        print("close")
    }
    
}


extension NewWorkoutView: UITextFieldDelegate {
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension NewWorkoutView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            dateAndRepeatLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
        
    }
}
