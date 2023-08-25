//
//  NetworkService.swift
//  EnemyLossesApp
//
//  Created by user on 25.08.2023.
//

import Foundation
import Combine

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getEquipmentLossesData() -> AnyPublisher<[Equipment], Error> {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession(configuration: .default)
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Equipment].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
    func getPersonnelLossesData() -> AnyPublisher<[Personnel], Error> {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession(configuration: .default)
            .dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: [Personnel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}


enum NetworkError: Error {
    case invalidURL
}
