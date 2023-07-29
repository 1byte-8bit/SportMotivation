//
//  TrainingsCollection.swift
//  FirstApp05.04
//
//  Created by Alexandr on 19.06.2022.
//

import UIKit


class TrainingsCollectionViewTemp: UIView {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none

        return collectionView
    }()
    
    private let idTrainingsCell = "idTrainingsCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setsDelegate()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        backgroundColor = .spetialLightBrown
        addSubview(collectionView)
//         Вначале задали UICollectionViewCell, т.к. не была создана наша ячейка
//         Затем заменили на CalendarCollectionViewCell
        collectionView.register(TrainingsCollectionViewCell.self,
                                forCellWithReuseIdentifier: idTrainingsCell
        )
        addSubview(collectionView)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setsDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension TrainingsCollectionViewTemp: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: idTrainingsCell,
            for: indexPath
        ) as? TrainingsCollectionViewCell else { return UICollectionViewCell() }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

}

extension TrainingsCollectionViewTemp: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Item")
    }

}

extension TrainingsCollectionViewTemp: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 10,
               height: collectionView.frame.height
        )
    }

}

extension TrainingsCollectionViewTemp {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10), // 105
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
}
