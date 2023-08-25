//
//  EquipmentViewController.swift
//  EnemyLossesApp
//
//  Created by user on 24.08.2023.
//

import UIKit
import Combine

class EquipmentViewController: UIViewController {

    private let viewModel: EquipmentViewModel
    
    private var bag = Set<AnyCancellable>()
    
    private let equipmentTableView: UITableView = {
        let equipmentTableView = UITableView()
        equipmentTableView.translatesAutoresizingMaskIntoConstraints = false
        equipmentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        equipmentTableView.backgroundColor = .systemGreen
        
        return equipmentTableView
    }()
    
    public init(viewModel: EquipmentViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(equipmentTableView)
        setupLayout()
        
        viewModel.$equipment
            .receive(on: DispatchQueue.main)
            .sink { [weak self] equipment in
                self?.equipmentTableView.reloadData()
            }
            .store(in: &bag)

    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            equipmentTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            equipmentTableView.trailingAnchor .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            equipmentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            equipmentTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
