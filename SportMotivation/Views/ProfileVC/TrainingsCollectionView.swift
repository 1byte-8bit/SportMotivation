//
//  TrainingsCollectionView.swift
//  FirstApp05.04
//
//  Created by Alexandr on 19.06.2022.
//

import UIKit

class TrainingsCollectionView: UIView {
    
    private let collectionView: UICollectionView = {
        // Create layout
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
        setConstraints()
        setsDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 20
        backgroundColor = .spetialBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.register(TrainingsCollectionViewCell.self,
                                forCellWithReuseIdentifier: idTrainingsCell
        )
    }
    
    private func setsDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension TrainingsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: idTrainingsCell,
            for: indexPath) as? TrainingsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.backgroundColor = (indexPath.row % 4 == 0 || indexPath.row % 4 == 3 ? .spetialGreen : .spetialDarkYellow)
        
        return cell
    }
}

extension TrainingsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Item: \(indexPath.row)")
    }
}

extension TrainingsCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2.07,
               height: collectionView.frame.height / 2.1
        )
    }

}

extension TrainingsCollectionView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
