//
//  MainViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class MainViewCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewModel = MainViewModel()
        
        mainViewModel.showEquipmentScreen = {
            let equipmentCoordinator = EquipmentViewCoordinator(navigationController: self.navigationController)
            equipmentCoordinator.start()
        }
        
        
        mainViewModel.showPersonnelScreen = {
            let personnelCoordinator = PersonnelViewCoordinator(navigationController: self.navigationController)
            personnelCoordinator.start()
        }
        
        
        let mainViewController: MainViewController = {
            let mainViewController = MainViewController(viewModel: mainViewModel)
            return mainViewController
        }()
        
        navigationController = UINavigationController(rootViewController: mainViewController)
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.configureWithTransparentBackground()
        barAppearance.backgroundColor = .clear
        
        navigationController.navigationBar.standardAppearance = barAppearance
        navigationController.navigationBar.scrollEdgeAppearance = barAppearance
    }
}
