//
//  WeatherView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 07.04.2022.
//

import UIKit


class WeatherView: UIView {
    
    //MARK: - Setup view elements
    private let topWeatherLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Солнечно"
        topLabel.font = .robotoMedium18() // My implementation
        topLabel.adjustsFontSizeToFitWidth = true
        topLabel.minimumScaleFactor = 0.5
        topLabel.textColor = #colorLiteral(red: 0.3137255013, green: 0.3137255013, blue: 0.3137255013, alpha: 1)
        topLabel.translatesAutoresizingMaskIntoConstraints = false // Преобразует маску в констрейнты = false
        
        return topLabel
    }()
    
    let bottomWeatherLabel: UILabel = {
        let bottomLabel = UILabel()
        
        bottomLabel.text = "Хорошая погода, чтобы позаниматься на улице"
        bottomLabel.font = .robotoMedium15()
        bottomLabel.adjustsFontSizeToFitWidth = true
        bottomLabel.minimumScaleFactor = 0.5
        bottomLabel.numberOfLines = 0
        bottomLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return bottomLabel
    }()
    
    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
            
        return imageView
    }()
    
    //MARK: - Initalization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup weather view
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = false
        
        addSubview(weatherIconImageView)
        addSubview(topWeatherLabel)
        addSubview(bottomWeatherLabel)
    }
    
    func setTopWeatherLabel(_ temp: String) {
        topWeatherLabel.text = "\(temp)°C"
    }
    
    func setImage(_ conditionName: String) {
        weatherIconImageView.image = UIImage(systemName: conditionName)
    }
    
}

//MARK: - Add Constraint
extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            weatherIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            topWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            topWeatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            topWeatherLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            bottomWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            bottomWeatherLabel.topAnchor.constraint(equalTo: topWeatherLabel.bottomAnchor, constant: 5),
            bottomWeatherLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor, constant: -7),
            bottomWeatherLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
