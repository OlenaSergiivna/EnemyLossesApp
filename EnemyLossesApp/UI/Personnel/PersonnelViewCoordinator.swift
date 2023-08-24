//
//  PersonnelViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class PersonnelViewCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let personnelViewModel = PersonnelViewModel()
        
        let personnelViewController: PersonnelViewController = {
            let personnelViewController = PersonnelViewController(viewModel: personnelViewModel)
            return personnelViewController
        }()
        
        navigationController.pushViewController(personnelViewController, animated: true)
    }
}
