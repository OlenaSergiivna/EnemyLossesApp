//
//  EquipmentViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class EquipmentViewCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let equipmentViewModel = EquipmentViewModel()
        
        let equipmentViewController: EquipmentViewController = {
            let equipmentViewController = EquipmentViewController(viewModel: equipmentViewModel)
            return equipmentViewController
        }()
        
        navigationController.pushViewController(equipmentViewController, animated: true)
        
    }
}
