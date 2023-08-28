//
//  PersonnelViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class PersonnelViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let personnelViewModel = PersonnelViewModel()
        
        personnelViewModel.showDetails = { personnel in
            let personnelDetailsViewModel = PersonnelDetailsViewModel(personnelData: personnel)
            let personnelDetaisCoordinator = PersonnelDetailsViewCoordinator(navigationController: self.navigationController, viewModel: personnelDetailsViewModel)
            personnelDetaisCoordinator.start()
        }
        
        let personnelViewController: PersonnelViewController = {
            let personnelViewController = PersonnelViewController(viewModel: personnelViewModel)
            return personnelViewController
        }()
        
        navigationController.pushViewController(personnelViewController, animated: true)
    }
}
