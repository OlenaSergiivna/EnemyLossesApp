//
//  CoordinatorProtocol.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import UIKit

protocol Coordinator {

    var navigationController: UINavigationController { get set }

    func start()
}
