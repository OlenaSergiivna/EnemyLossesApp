//
//  MainViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
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
        background.backgroundColor = UIColor(red: 79/255, green: 70/255, blue: 52/255, alpha: 1)
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = UIColor(red: 255/255, green: 140/255, blue: 9/255, alpha: 1)
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
        background.backgroundColor = UIColor(red: 79/255, green: 70/255, blue: 52/255, alpha: 1)
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = UIColor(red: 255/255, green: 140/255, blue: 9/255, alpha: 1)
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

        view.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
        
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(equipmentButton)
        buttonsStack.addArrangedSubview(personnelButton)
        
        configureConstraints()
        
        equipmentButton.addTarget(self, action: #selector(equipmentButtonPressed(_:)), for: .touchUpInside)
        personnelButton.addTarget(self, action: #selector(personnelButtonPressed(_:)), for: .touchUpInside)
    }
    
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            buttonsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonsStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            buttonsStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)
        ])
    }
    
    
    @objc func equipmentButtonPressed(_ sender: UIButton) {
        guard let showEquipmentScreen = viewModel.showEquipmentScreen else { return }
        showEquipmentScreen()
    }
    
    @objc func personnelButtonPressed(_ sender: UIButton) {
        guard let showPersonnelScreen = viewModel.showPersonnelScreen else { return }
        showPersonnelScreen()
    }
}
