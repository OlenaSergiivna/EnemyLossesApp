//
//  MainStackElementView.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import UIKit

class MainStackElementView: UIView {
    
    let equipmentImage: UIImageView = {
        let equipmentImage = UIImageView()
        equipmentImage.translatesAutoresizingMaskIntoConstraints = false
        equipmentImage.clipsToBounds = true
        equipmentImage.tintColor = .white
        equipmentImage.contentMode = .scaleToFill
        
        return equipmentImage
    }()
    
    
    let numberOfLossesLabel: UILabel = {
        let numberOfLossesLabel = UILabel()
        numberOfLossesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfLossesLabel.textColor = GlobalColor.globalOrange
        numberOfLossesLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        return numberOfLossesLabel
    }()
    
    
    let equipmentNameLabel: UILabel = {
        let equipmentNameLabel = UILabel()
        equipmentNameLabel.translatesAutoresizingMaskIntoConstraints = false
        equipmentNameLabel.textColor = GlobalColor.globalOrange
        equipmentNameLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        return equipmentNameLabel
    }()
    
    
    private var portraitConst: [NSLayoutConstraint] = []
    private var landscapeConst: [NSLayoutConstraint] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(equipmentImage)
        addSubview(numberOfLossesLabel)
        addSubview(equipmentNameLabel)
        
        setUpConstraints()
        
        if (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .regular) || (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .compact) {
            
            NSLayoutConstraint.activate(landscapeConst)
            
        } else {
            
            NSLayoutConstraint.activate(portraitConst)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpConstraints() {
        
        portraitConst = [
            
            equipmentImage.topAnchor.constraint(equalTo: topAnchor),
            equipmentImage.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            equipmentImage.heightAnchor.constraint(equalTo: equipmentImage.widthAnchor),
            equipmentImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfLossesLabel.topAnchor.constraint(equalTo: equipmentImage.bottomAnchor, constant: 8),
            numberOfLossesLabel.centerXAnchor.constraint(equalTo: equipmentImage.centerXAnchor),
            
            equipmentNameLabel.topAnchor.constraint(equalTo: numberOfLossesLabel.bottomAnchor),
            equipmentNameLabel.centerXAnchor.constraint(equalTo: equipmentImage.centerXAnchor),
            equipmentNameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor)
            
        ]
        
        landscapeConst = [
            equipmentImage.topAnchor.constraint(equalTo: topAnchor),
            equipmentImage.widthAnchor.constraint(equalToConstant: 80),
            equipmentImage.heightAnchor.constraint(equalTo: equipmentImage.widthAnchor),
            equipmentImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfLossesLabel.topAnchor.constraint(equalTo: equipmentImage.bottomAnchor, constant: 8),
            numberOfLossesLabel.centerXAnchor.constraint(equalTo: equipmentImage.centerXAnchor),
            
            equipmentNameLabel.topAnchor.constraint(equalTo: numberOfLossesLabel.bottomAnchor),
            equipmentNameLabel.centerXAnchor.constraint(equalTo: equipmentImage.centerXAnchor),
            equipmentNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        if (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .regular) || (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .compact) {
            
            NSLayoutConstraint.deactivate(portraitConst)

            NSLayoutConstraint.activate(landscapeConst)
            
        } else {
            NSLayoutConstraint.deactivate(landscapeConst)

            NSLayoutConstraint.activate(portraitConst)
        }
    }
}
