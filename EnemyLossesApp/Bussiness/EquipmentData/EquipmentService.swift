//
//  EquipmentService.swift
//  EnemyLossesApp
//
//  Created by user on 25.08.2023.
//

import Foundation
import Combine

class EquipmentService {
    
    static let shared = EquipmentService()
    
    private init() {}
    
    var equipment: CurrentValueSubject<[Equipment], Never> = CurrentValueSubject([])
    
    private var bag: Set<AnyCancellable> = []
    
    func getEquipmentData() {
        NetworkService.shared.getEquipmentLossesData()
            .receive(on: DispatchQueue.main)
            .map({$0.reversed()})
            .sink { _ in
            } receiveValue: { [weak self] equipment in
                self?.equipment.value = equipment
            }
            .store(in: &bag)
    }
}
