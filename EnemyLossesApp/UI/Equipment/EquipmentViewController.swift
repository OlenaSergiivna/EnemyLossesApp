//
//  EquipmentViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class EquipmentViewController: UIViewController {

    private let viewModel: EquipmentViewModel
    
    
    public init(viewModel: EquipmentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .black
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
