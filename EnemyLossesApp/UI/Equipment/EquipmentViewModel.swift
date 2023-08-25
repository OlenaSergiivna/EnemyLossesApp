//
//  EquipmentViewModel.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import Foundation
import Combine

class EquipmentViewModel {
    
    let equipmentService = EquipmentService.shared
    
    private var bag = Set<AnyCancellable>()
    
    @Published var equipment: [Equipment] = []
    
    var showDetail: ((Equipment) -> Void)?
    
    init() {
        equipmentService.getEquipmentData()
        
        equipmentService.equipment
            .receive(on: DispatchQueue.main)
            .sink { [weak self] equipment in
                self?.equipment = equipment
            }
            .store(in: &bag)
    }
}
