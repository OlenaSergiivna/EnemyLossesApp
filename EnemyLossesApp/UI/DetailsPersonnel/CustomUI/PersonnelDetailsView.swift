//
//  PersonnelDetailsView.swift
//  EnemyLossesApp
//
//  Created by user on 27.08.2023.
//

import UIKit

class PersonnelDetailsView: UIView {
    
    let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        dayLabel.textColor = GlobalColor.globalOrange
        
        return dayLabel
    }()
    
    
    let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "zsu_logo")?.withTintColor(GlobalColor.globalOrange)
        
        return logoImage
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
    
    
    let personnelView: PersonnelStackElementView = {
        let personnelView = PersonnelStackElementView()
        personnelView.personnelNameLabel.text = "Personnel"
        
        return personnelView
    }()
    
    
    let powView: PersonnelStackElementView = {
        let powView = PersonnelStackElementView()
        powView.personnelNameLabel.text = "Prisoners of war"
        
        return powView
    }()
    
    
    private var portraitConst: [NSLayoutConstraint] = []
    private var landscapeConst: [NSLayoutConstraint] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dayLabel)
        addSubview(logoImage)
        addSubview(dateLabel)
        addSubview(mainLosseskStack)
        mainLosseskStack.addArrangedSubview(personnelView)
        mainLosseskStack.addArrangedSubview(powView)
        
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
            dayLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 8),
            dayLabel.heightAnchor.constraint(equalToConstant: 40),
            
            logoImage.heightAnchor.constraint(equalTo: dayLabel.heightAnchor, multiplier: 0.7),
            logoImage.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor, multiplier: 0.8),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: logoImage.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            
            mainLosseskStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 40),
            mainLosseskStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainLosseskStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainLosseskStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3),
        ]
        
        landscapeConst = [
            
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            dayLabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: 8),
            dayLabel.heightAnchor.constraint(equalToConstant: 40),

            logoImage.heightAnchor.constraint(equalTo: dayLabel.heightAnchor, multiplier: 0.7),
            logoImage.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor, multiplier: 0.8),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: logoImage.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            
            mainLosseskStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            mainLosseskStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainLosseskStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainLosseskStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
        ]
    }
    
    
    func configure(with personnel: Personnel) {
        
        if let day = personnel.day {
            dayLabel.text = "Day \(day)"
        }
        
        let result = getFormattedData(for: personnel.date)
        if case let .success(formattedDate) = result {
            dateLabel.text = formattedDate
        }
        
        if let personnel = personnel.personnel {
            personnelView.numberOfLossesLabel.text = "\(personnel)"
        }
        
        if let pow = personnel.pow {
            powView.isHidden = false
            powView.numberOfLossesLabel.text = "\(pow)"
        } else {
            powView.isHidden = true
        }
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
