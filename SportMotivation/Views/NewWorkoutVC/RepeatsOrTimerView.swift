//
//  RepeatsOrTimerView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 15.04.2022.
//

import UIKit
//import SwiftUI

class RepeatsOrTimerView: UIView {
    
    private let setsTextLabel = UILabel(text: "Sets", fontSize: 18, textColor: .spetialGray)
    private let setsLabel = UILabel(text: "0", fontSize: 24, textColor: .spetialGray)
    private let chooseRepeatOrTimerLabel = UILabel(text: "Choose repeat or timer", fontSize: 15, textColor: .spetialBrown)
    private let repsTextLabel = UILabel(text: "Reps", fontSize: 18, textColor: .spetialGray)
    private let repsLabel = UILabel(text: "0", fontSize: 24, textColor: .spetialGray)
    private let timerTextLabel = UILabel(text: "Timer", fontSize: 18, textColor: .spetialGray)
    private let timerLabel = UILabel(text: "0 sec", fontSize: 24, textColor: .spetialGray)
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    private var timerStackView = UIStackView()
    
    lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .spetialGreen
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(setsSliderValue), for: .valueChanged)
        
        return slider
    }()
    
    lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .spetialGreen
        slider.minimumValue = 0
        slider.maximumValue = 50
//        slider.addTarget(self,
//                        action: #selector(activateTimerSlider),
//                        for: .touchUpInside)
        slider.addTarget(self, action: #selector(repsSliderValue), for: .valueChanged)
        
        return slider
    }()
    
    lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .spetialGreen
        slider.maximumValue = 0
        slider.maximumValue = 960
        slider.addTarget(self, action: #selector(timerSliderValue), for: .valueChanged)
//        slider.addTarget(self,
//                        action: #selector(activateRepsSlider),
//                        for: .touchUpInside)
        
        return slider
    }()
    
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
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        setsStackView = UIStackView(arrangedSubviews: [setsTextLabel,
                                                       setsLabel],
                                     axis: .horizontal,
                                  spacing: 150)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsSlider)
        
        repsStackView = UIStackView(arrangedSubviews: [repsTextLabel,
                                                       repsLabel],
                                     axis: .horizontal,
                                     spacing: 150)
        repsStackView.distribution = .equalSpacing
        addSubview(repsStackView)
        addSubview(repsSlider)
        
        timerStackView = UIStackView(arrangedSubviews: [timerTextLabel,
                                                        timerLabel],
                                     axis: .horizontal,
                                     spacing: 100)
        timerStackView.distribution = .equalSpacing
        addSubview(timerStackView)
        addSubview(timerSlider)
        
    }
    
    private func refreshWorkoutObjects() {
        setsLabel.text = "0"
        setsSlider.value = 0
        
        repsLabel.text = "0"
        repsSlider.value = 0
        repsSlider.isEnabled = true
        
        timerLabel.text = "0 sec"
        timerSlider.value = 0
        timerSlider.isEnabled = true
    }
    
    public func refreshLabelsAndSliders(){
        refreshWorkoutObjects()
    }
    
    
    @objc private func repsSliderValue() {
        lazy var sliderValue = Int(repsSlider.value)
        
        if sliderValue != 0 {
            deactivateSlider(slider: timerSlider, label: timerLabel, textLabel: timerTextLabel)
        } else {
            activateSlider(slider: timerSlider, label: timerLabel, textLabel: timerTextLabel)
        }
        
        repsLabel.text = String(sliderValue)
    }
    
    @objc private func setsSliderValue() {
        lazy var sliderValue = Int(setsSlider.value)
        
        setsLabel.text = String(sliderValue)
    }
    
    @objc private func timerSliderValue() {
        lazy var sliderValue = Int(timerSlider.value)
        
        if sliderValue != 0 {
            deactivateSlider(slider: repsSlider, label: repsLabel, textLabel: repsTextLabel)
        } else {
            activateSlider(slider: repsSlider, label: repsLabel, textLabel: repsTextLabel)
        }
        
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)}(sliderValue)
        
        if min != 0 {
            timerLabel.text = sec != 0 ? "\(min) min \(sec) sec" : "\(min) min"
        } else {
            timerLabel.text = min != 0 ? "\(min) min \(sec) sec" : "\(sec) sec"
        }
    }
    
    private func deactivateSlider(slider: UISlider, label: UILabel, textLabel: UILabel) {
        slider.isEnabled = false
        slider.layer.opacity = 0.5
        label.isEnabled = false
        label.layer.opacity = 0.5
        textLabel.isEnabled = false
        textLabel.layer.opacity = 0.5
    }
    
    private func activateSlider(slider: UISlider, label: UILabel, textLabel: UILabel) {
        slider.isEnabled = true
        slider.layer.opacity = 1
        label.isEnabled = true
        label.layer.opacity = 1
        textLabel.isEnabled = true
        textLabel.layer.opacity = 1
    }
    
//    public func getSetsSliderValue() -> Int {
//        return Int(setsSlider.value)
//    }
//
//    public func getRepsSliderValue() -> Int {
//        return Int(repsSlider.value)
//    }
//
//    public func getTimerSliderValue() -> Int {
//        return Int(timerSlider.value)
//    }
    
    public func getSlidersValues() -> (Int, Int, Int) {
        let setsSliderValue = Int(setsSlider.value)
        let repsSliderValue = Int(repsSlider.value)
        let timerSliderValue = Int(timerSlider.value)
        
        return (setsSliderValue, repsSliderValue, timerSliderValue)
    }

}


extension RepeatsOrTimerView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 10),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 10),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
