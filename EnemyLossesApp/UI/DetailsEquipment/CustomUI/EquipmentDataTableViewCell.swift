//
//  EquipmentDataTableViewCell.swift
//  EnemyLossesApp
//
//  Created by user on 27.08.2023.
//

import UIKit

class EquipmentDataCollectionViewCell: UICollectionViewCell {
    
    private let equipmentTypeLabel: UILabel = {
        let equipmentTypeLabel = UILabel()
        equipmentTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        equipmentTypeLabel.textAlignment = .right
        equipmentTypeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        equipmentTypeLabel.textColor = UIColor(red: 255/255, green: 140/255, blue: 9/255, alpha: 1)
        equipmentTypeLabel.numberOfLines = 2
        equipmentTypeLabel.lineBreakMode = .byWordWrapping
        
        return equipmentTypeLabel
    }()
    
    
    private let lossesNumberLabel: UILabel = {
        let lossesNumberLabel = UILabel()
        lossesNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        lossesNumberLabel.textAlignment = .left
        lossesNumberLabel.font = .systemFont(ofSize: 14, weight: .light)
        lossesNumberLabel.textColor = .white
        
        return lossesNumberLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        contentView.addSubview(equipmentTypeLabel)
        contentView.addSubview(lossesNumberLabel)

        addBottomBorder()
        setUpConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            lossesNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            lossesNumberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lossesNumberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            equipmentTypeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            equipmentTypeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.centerXAnchor, constant: -24),
            equipmentTypeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
    func configure(with equipment: EquipmentData) {
        
        equipmentTypeLabel.text = equipment.equipmentType
        lossesNumberLabel.text = "\(equipment.lossesNumber)"
    }
    
    func addBottomBorder() {
            let border = CALayer()
        border.backgroundColor = UIColor.systemGray5.withAlphaComponent(0.2).cgColor
            border.frame = CGRect(x: 0, y: frame.size.height - 1, width: frame.size.width, height: 1)
            layer.addSublayer(border)
        }
}
