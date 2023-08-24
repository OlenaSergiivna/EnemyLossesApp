//
//  PersonnelViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit

class PersonnelViewController: UIViewController {

    private let viewModel: PersonnelViewModel
    
    
    public init(viewModel: PersonnelViewModel) {
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
