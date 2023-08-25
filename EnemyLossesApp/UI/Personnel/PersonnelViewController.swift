//
//  PersonnelViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit
import Combine

class PersonnelViewController: UIViewController {

    private let viewModel: PersonnelViewModel
    
    private var bag = Set<AnyCancellable>()
    
    private let personnelTableView: UITableView = {
        let personnelTableView = UITableView()
        personnelTableView.translatesAutoresizingMaskIntoConstraints = false
        return personnelTableView
    }()
    
    public init(viewModel: PersonnelViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        
        view.addSubview(personnelTableView)
        setupLayout()
        
        viewModel.$personnel
            .receive(on: DispatchQueue.main)
            .sink { [weak self] personnel in
                self?.personnelTableView.reloadData()
            }
            .store(in: &bag)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            personnelTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            personnelTableView.trailingAnchor .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            personnelTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            personnelTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
