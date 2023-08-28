//
//  MainViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.image = UIImage(named: "zsu_logo_crop")?.withTintColor(GlobalColor.darkMilitary)
        return logoView
    }()
    
    
    let topTextLabel: UILabel = {
        let topTextLabel = UILabel()
        topTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topTextLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        topTextLabel.textColor = GlobalColor.globalOrange
        topTextLabel.textAlignment = .left
        topTextLabel.numberOfLines = 2
        
        let text = "Approximate enemy losses\nin the russia-Ukraine war"
        let attrText = text.withAttributedText(text: "russia-Ukraine war", weight: .semibold, color: .white)
        topTextLabel.attributedText = attrText
        
        return topTextLabel
    }()
    
    
    let equipmentButton: UIButton = {
        let equipmentButton = UIButton()
        equipmentButton.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
        buttonConfiguration.titleLineBreakMode = .byClipping
        buttonConfiguration.titleAlignment = .center
        
        var attText = AttributedString.init("Equipment")
        attText.font = UIFont.systemFont(ofSize: 24.0, weight: .regular)
        attText.foregroundColor = .white
        buttonConfiguration.attributedTitle = attText
        
        var background = buttonConfiguration.background
        background.backgroundColor = GlobalColor.lightMilitary
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = GlobalColor.globalOrange
        buttonConfiguration.background = background
        
        equipmentButton.configuration = buttonConfiguration
        
        return equipmentButton
    }()
    
    
    let personnelButton: UIButton = {
        let personnelButton = UIButton()
        personnelButton.translatesAutoresizingMaskIntoConstraints = false
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
        buttonConfiguration.titleLineBreakMode = .byClipping
        buttonConfiguration.titleAlignment = .center
        
        var attText = AttributedString.init("Personnel")
        attText.font = UIFont.systemFont(ofSize: 24.0, weight: .regular)
        attText.foregroundColor = .white
        buttonConfiguration.attributedTitle = attText
        
        var background = buttonConfiguration.background
        background.backgroundColor = GlobalColor.lightMilitary
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = GlobalColor.globalOrange
        buttonConfiguration.background = background
        
        personnelButton.configuration = buttonConfiguration
        
        return personnelButton
    }()
    
    
    let buttonsStack: UIStackView = {
        let buttonsStack = UIStackView()
        buttonsStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsStack.axis = .vertical
        buttonsStack.spacing = 32
        buttonsStack.distribution = .fillEqually
        buttonsStack.alignment = .fill
        
        return buttonsStack
    }()
    
    
    private var portraitConst: [NSLayoutConstraint] = []
    private var landscapeConst: [NSLayoutConstraint] = []
    
    
    private let viewModel: MainViewModel
    
    public init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = GlobalColor.lightMilitary
        
        view.addSubview(logoView)
        view.addSubview(topTextLabel)
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(equipmentButton)
        buttonsStack.addArrangedSubview(personnelButton)
        
        configureConstraints()
        
        if (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .regular) || (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .compact) {
            
            buttonsStack.spacing = 16
            NSLayoutConstraint.activate(landscapeConst)
            
        } else {
            buttonsStack.spacing = 32
            NSLayoutConstraint.activate(portraitConst)
        }
        
        equipmentButton.addTarget(self, action: #selector(equipmentButtonPressed(_:)), for: .touchUpInside)
        personnelButton.addTarget(self, action: #selector(personnelButtonPressed(_:)), for: .touchUpInside)
    }
    
    
    func configureConstraints() {
        
        portraitConst = [
            
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            
            logoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            topTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            topTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            topTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            topTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: buttonsStack.topAnchor, constant: -16)
        ]
        
        landscapeConst = [
            
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2.5),
            buttonsStack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
            
            logoView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            logoView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            topTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            topTextLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            topTextLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            topTextLabel.bottomAnchor.constraint(equalTo: buttonsStack.topAnchor, constant: -16)
        ]
    }
    
    
    @objc func equipmentButtonPressed(_ sender: UIButton) {
        guard let showEquipmentScreen = viewModel.showEquipmentScreen else { return }
        showEquipmentScreen()
    }
    
    @objc func personnelButtonPressed(_ sender: UIButton) {
        guard let showPersonnelScreen = viewModel.showPersonnelScreen else { return }
        showPersonnelScreen()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        if (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .regular) || (traitCollection.verticalSizeClass == .compact && traitCollection.horizontalSizeClass == .compact) {
            
            NSLayoutConstraint.deactivate(portraitConst)
            buttonsStack.spacing = 16
            NSLayoutConstraint.activate(landscapeConst)
            
        } else {
            NSLayoutConstraint.deactivate(landscapeConst)
            buttonsStack.spacing = 32
            NSLayoutConstraint.activate(portraitConst)
        }
    }
}
