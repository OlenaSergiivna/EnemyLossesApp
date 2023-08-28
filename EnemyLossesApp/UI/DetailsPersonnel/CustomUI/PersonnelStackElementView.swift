//
//  PersonnelStackElementView.swift
//  EnemyLossesApp
//
//  Created by user on 27.08.2023.
//

import UIKit

class PersonnelStackElementView: UIView {
    
    let backImage: UIImageView = {
        let backImage = UIImageView()
        backImage.translatesAutoresizingMaskIntoConstraints = false
        backImage.clipsToBounds = true
        backImage.contentMode = .scaleToFill
        backImage.layer.borderColor = GlobalColor.globalOrange.cgColor
        backImage.layer.borderWidth = 1
        
        return backImage
    }()
    
    
    let numberOfLossesLabel: UILabel = {
        let numberOfLossesLabel = UILabel()
        numberOfLossesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfLossesLabel.textColor = .white
        numberOfLossesLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        return numberOfLossesLabel
    }()
    
    
    let personnelNameLabel: UILabel = {
        let personnelNameLabel = UILabel()
        personnelNameLabel.translatesAutoresizingMaskIntoConstraints = false
        personnelNameLabel.textColor = GlobalColor.globalOrange
        personnelNameLabel.font = .systemFont(ofSize: 24, weight: .regular)
        
        return personnelNameLabel
    }()
    
    
    private var portraitConst: [NSLayoutConstraint] = []
    private var landscapeConst: [NSLayoutConstraint] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backImage)
        addSubview(numberOfLossesLabel)
        addSubview(personnelNameLabel)
        
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
            
            backImage.topAnchor.constraint(equalTo: topAnchor),
            backImage.widthAnchor.constraint(equalTo: backImage.heightAnchor),
            backImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            backImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfLossesLabel.centerXAnchor.constraint(equalTo: backImage.centerXAnchor),
            numberOfLossesLabel.centerYAnchor.constraint(equalTo: backImage.centerYAnchor),
            
            personnelNameLabel.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 16),
            personnelNameLabel.centerXAnchor.constraint(equalTo: backImage.centerXAnchor),
            personnelNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ]
        
        landscapeConst = [
            backImage.topAnchor.constraint(equalTo: topAnchor),
            backImage.widthAnchor.constraint(equalTo: backImage.heightAnchor),
            backImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.76),
            backImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            numberOfLossesLabel.centerXAnchor.constraint(equalTo: backImage.centerXAnchor),
            numberOfLossesLabel.centerYAnchor.constraint(equalTo: backImage.centerYAnchor),
            
            personnelNameLabel.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 16),
            personnelNameLabel.centerXAnchor.constraint(equalTo: backImage.centerXAnchor),
            personnelNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backImage.layer.cornerRadius = backImage.frame.height / 2
    }
}
