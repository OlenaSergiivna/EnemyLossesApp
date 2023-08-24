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
        background.backgroundColor = .black
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = .magenta
        buttonConfiguration.background = background
        
        equipmentButton.configuration = buttonConfiguration
        
        equipmentButton.addTarget(self, action: #selector(equipmentButtonPressed(_:)), for: .touchUpInside)
        
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
        background.backgroundColor = .black
        background.cornerRadius = 20
        background.strokeWidth = 2
        background.strokeColor = .magenta
        buttonConfiguration.background = background
        
        personnelButton.configuration = buttonConfiguration
        
        personnelButton.addTarget(self, action: #selector(personnelButtonPressed(_:)), for: .touchUpInside)
        
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
        
        view.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(equipmentButton)
        buttonsStack.addArrangedSubview(personnelButton)
        
        configureConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
