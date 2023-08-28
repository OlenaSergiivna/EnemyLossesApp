//
//  EquipmentDetailsViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import UIKit

class EquipmentDetailsViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var viewModel: EquipmentDetailsViewModel
    
    init(navigationController: UINavigationController, viewModel: EquipmentDetailsViewModel) {
        self.viewModel = viewModel
        self.navigationController = navigationController
    }
    
    func start() {
        
        let equipmentViewController = EquipmentDetailsViewController(viewModel: self.viewModel)
        navigationController.pushViewController(equipmentViewController, animated: true)
    }
}
