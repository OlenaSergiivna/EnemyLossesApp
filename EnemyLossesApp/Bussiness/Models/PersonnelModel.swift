//
//  PersonnelModel.swift
//  EnemyLossesApp
//
//  Created by user on 25.08.2023.
//

import Foundation

struct Personnel: Codable {
    
    let date: String
    let day, personnel: Int?
    let personnelAsterisk: String?
    let pow: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelAsterisk = "personnel*"
        case pow = "POW"
    }
}
