//
//  PersonnelService.swift
//  EnemyLossesApp
//
//  Created by user on 25.08.2023.
//

import Foundation
import Combine

class PersonnelService {
    
    static let shared = PersonnelService()
    
    private init() {}
    
    var personnel: CurrentValueSubject<[Personnel], Never> = CurrentValueSubject([])
    
    private var bag: Set<AnyCancellable> = []
    
    func getPersonnelData() {
        NetworkService.shared.getPersonnelLossesData()
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self] personnel in
                self?.personnel.value = personnel
            }
            .store(in: &bag)
    }
}
