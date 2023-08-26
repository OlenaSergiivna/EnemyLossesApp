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
        equipmentTableView.register(EquipmentTableViewCell.self, forCellReuseIdentifier: "\(EquipmentTableViewCell.self)")
        equipmentTableView.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
        
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
        
        view.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
        view.addSubview(equipmentTableView)
        setupLayout()
        
        equipmentTableView.delegate = self
        equipmentTableView.dataSource = self
        
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


extension EquipmentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.equipment.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = equipmentTableView.dequeueReusableCell(withIdentifier: "\(EquipmentTableViewCell.self)", for: indexPath) as? EquipmentTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: viewModel.equipment[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}


extension EquipmentViewController: UITableViewDelegate {
    
}
