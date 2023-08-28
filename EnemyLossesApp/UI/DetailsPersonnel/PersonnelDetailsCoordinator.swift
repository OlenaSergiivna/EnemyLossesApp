//
//  PersonnelDetailsViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 28.08.2023.
//

import UIKit

class PersonnelDetailsViewCoordinator {
    
    var navigationController: UINavigationController
    var viewModel: PersonnelDetailsViewModel
    
    init(navigationController: UINavigationController, viewModel: PersonnelDetailsViewModel) {
        self.viewModel = viewModel
        self.navigationController = navigationController
    }
    
    func start() {
        
        let personnelViewController = PersonnelDetailsViewController(viewModel: self.viewModel)
        personnelViewController.navigationItem.largeTitleDisplayMode = .never
        
        navigationController.pushViewController(personnelViewController, animated: true)
    }
}
