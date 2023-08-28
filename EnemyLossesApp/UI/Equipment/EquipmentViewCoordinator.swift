//
//  EquipmentViewCoordinator.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class EquipmentViewCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let equipmentViewModel = EquipmentViewModel()
        
        equipmentViewModel.showDetails = { equipment in
            let equipmentDetailsViewModel = EquipmentDetailsViewModel(equipmenData: equipment)
            let equipmentDetaisCoordinator = EquipmentDetailsViewCoordinator(navigationController: self.navigationController, viewModel: equipmentDetailsViewModel)
            equipmentDetaisCoordinator.start()
        }
        
        let equipmentViewController: EquipmentViewController = {
            let equipmentViewController = EquipmentViewController(viewModel: equipmentViewModel)
            return equipmentViewController
        }()
        
        navigationController.pushViewController(equipmentViewController, animated: true)
        
    }
}
