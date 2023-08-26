//
//  PersonnelViewModel.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import Foundation
import Combine

class PersonnelViewModel {
    
    let personnelService = PersonnelService.shared
    
    private var bag = Set<AnyCancellable>()
    
    @Published var personnel: [Personnel] = []
    
    var showDetails: ((Personnel) -> Void)?
    
    init() {
        personnelService.getPersonnelData()
        
        personnelService.personnel
            .receive(on: DispatchQueue.main)
            .map({$0.reversed()})
            .sink { [weak self] personnel in
                self?.personnel = personnel
            }
            .store(in: &bag)
    }
}
