//
//  EquipmentTableViewCell.swift
//  EnemyLossesApp
//
//  Created by user on 25.08.2023.
//

import UIKit

class EquipmentTableViewCell: UITableViewCell {

    let backView: UIImageView = {
        let backView = UIImageView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor(red: 79/255, green: 70/255, blue: 52/255, alpha: 1)
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 20
        return backView
    }()
    
    
    private let dayLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .systemFont(ofSize: 28, weight: .medium)
        dayLabel.textColor = UIColor(red: 255/255, green: 140/255, blue: 9/255, alpha: 1)
        return dayLabel
    }()
    
    
    private let dateLabel: UILabel = {
        let dayLabel = UILabel()
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.textAlignment = .left
        dayLabel.font = .systemFont(ofSize: 20, weight: .light)
        dayLabel.textColor = .white
        return dayLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
        
        contentView.addSubview(backView)
        backView.addSubview(dayLabel)
        backView.addSubview(dateLabel)
        
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dayLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            
            dateLabel.centerYAnchor.constraint(equalTo: dayLabel.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with data: Equipment) {
        dateLabel.text = data.date
        
        guard let day = data.day else { return }
        dayLabel.text = "Day \(day)"
    }
}
