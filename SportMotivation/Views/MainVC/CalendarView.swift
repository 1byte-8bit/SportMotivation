//
//  CalendarView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 07.04.2022.
//

import UIKit
import SwiftUI


class CalendarView: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1//3
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        
        return collectionView
    }()
    
    private let idCalendarCell = "idCalendarCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setsDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .spetialGreen
        layer.cornerRadius = 6
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        // Вначале задали UICollectionViewCell, т.к. не была создана наша ячейка
        // Затем заменили на CalendarCollectionViewCell
        collectionView.register(CalendarCollectionViewCell.self,
                                forCellWithReuseIdentifier: idCalendarCell
        )
    }
    
    private func setsDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

//MARK: - Data source protocol
extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: idCalendarCell,
            for: indexPath
        ) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        
        let dateTimeZone = Date().localDate() // some date
//        print("Original Date (in GMT): \(dateTimeZone)")
        
        let weekArray = dateTimeZone.getWeekArray()
        
//        print("Week Array \(weekArray)")
        
        cell.dateForCell(numberOfDay: weekArray[1][indexPath.item], dayOfWeek: weekArray[0][indexPath.item])
        
        if indexPath.item == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
        
        return cell
    }
    
}
//MARK: - Delegate protocol
extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Item")
    }
    
}

extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 10,
               height: collectionView.frame.height
        )
    }
    
}

extension CalendarView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105), // 105
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}
