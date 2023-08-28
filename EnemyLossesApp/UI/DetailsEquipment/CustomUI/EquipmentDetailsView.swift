//
//  EquipmentDetailsView.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import UIKit

class EquipmentDetailsView: UIView {
    
    let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        dayLabel.textColor = GlobalColor.globalOrange
        
        return dayLabel
    }()
    
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textAlignment = .left
        dateLabel.font = .systemFont(ofSize: 16, weight: .regular)
        dateLabel.textColor = .white
        
        return dateLabel
    }()
    
    
    let mainLosseskStack: UIStackView = {
        let mainLosseskStack = UIStackView()
        mainLosseskStack.translatesAutoresizingMaskIntoConstraints = false
        mainLosseskStack.axis = .horizontal
        mainLosseskStack.spacing = 16
        mainLosseskStack.alignment = .fill
        mainLosseskStack.distribution = .fillEqually
        mainLosseskStack.clipsToBounds = true
        
        return mainLosseskStack
    }()
    
    
    let tanksView: MainStackElementView = {
        let tanksView = MainStackElementView()
        tanksView.equipmentNameLabel.text = "Tanks"
        tanksView.equipmentImage.image = UIImage(named: "tank")?.withTintColor(.white)

        return tanksView
    }()
    
    
    let helicoptersView: MainStackElementView = {
        let helicoptersView = MainStackElementView()
        helicoptersView.equipmentNameLabel.text = "Helicopters"
        helicoptersView.equipmentImage.image = UIImage(named: "helicopter")?.withTintColor(.white)
        
        return helicoptersView
    }()
    
    
    let aircraftsView: MainStackElementView = {
        let aircraftsView = MainStackElementView()
        aircraftsView.equipmentNameLabel.text = "Aircrafts"
        aircraftsView.equipmentImage.image = UIImage(named: "aircraft")?.withTintColor(.white)
        
        return aircraftsView
    }()
    
    
    let artillerySystemsView: MainStackElementView = {
        let artillerySystemsView = MainStackElementView()
        artillerySystemsView.equipmentNameLabel.text = "Artillery"
        artillerySystemsView.equipmentImage.image = UIImage(named: "artillery")?.withTintColor(.white)
        
        return artillerySystemsView
    }()
    
    
    let detailedEquipmentLossesCollectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        let detailedEquipmentLossesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        detailedEquipmentLossesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        detailedEquipmentLossesCollectionView.backgroundColor = .clear
        
        return detailedEquipmentLossesCollectionView
    }()
    
    
    private var portraitConst: [NSLayoutConstraint] = []
    private var landscapeConst: [NSLayoutConstraint] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dayLabel)
        addSubview(dateLabel)
        addSubview(mainLosseskStack)
        
        mainLosseskStack.addArrangedSubview(tanksView)
        mainLosseskStack.addArrangedSubview(helicoptersView)
        mainLosseskStack.addArrangedSubview(aircraftsView)
        mainLosseskStack.addArrangedSubview(artillerySystemsView)
        
        addSubview(detailedEquipmentLossesCollectionView)
        
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
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            
            mainLosseskStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
            mainLosseskStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainLosseskStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainLosseskStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/6),
            
            detailedEquipmentLossesCollectionView.topAnchor.constraint(equalTo: mainLosseskStack.bottomAnchor, constant: 40),
            detailedEquipmentLossesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailedEquipmentLossesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailedEquipmentLossesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ]
        
        landscapeConst = [
            
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: dayLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            
            mainLosseskStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            mainLosseskStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainLosseskStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainLosseskStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2.5),
            
            detailedEquipmentLossesCollectionView.topAnchor.constraint(equalTo: mainLosseskStack.bottomAnchor, constant: 16),
            detailedEquipmentLossesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            detailedEquipmentLossesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            detailedEquipmentLossesCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            detailedEquipmentLossesCollectionView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
        ]
    }
    
    
    func configure(with equipment: Equipment) {
        
        dayLabel.text = "Day \(equipment.day)"
        
        let result = getFormattedData(for: equipment.date)
        if case let .success(formattedDate) = result {
            dateLabel.text = formattedDate
        }
        
        tanksView.numberOfLossesLabel.text = "\(equipment.tank)"
        helicoptersView.numberOfLossesLabel.text = "\(equipment.helicopter)"
        aircraftsView.numberOfLossesLabel.text = "\(equipment.aircraft)"
        artillerySystemsView.numberOfLossesLabel.text = "\(equipment.fieldArtillery)"
        
    }
    
    func getFormattedData(for date: String) -> Result<String, Error> {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let initialDate = dateFormatter.date(from: date) else {
            return .failure(GeneralErrors.failedWhenFormattingInitialDate)
        }
        
        
        let dayOfMonth = Calendar.current.component(.day, from: initialDate)
        let formattedDate: String
        
        if dayOfMonth < 10 {
            dateFormatter.dateFormat = "d MMMM yyyy"
            formattedDate = dateFormatter.string(from: initialDate)
            
        } else {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            formattedDate = dateFormatter.string(from: initialDate)
        }
        
        return .success(formattedDate)
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
