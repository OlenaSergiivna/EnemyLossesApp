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
        personnelTableView.register(DateTableViewCell.self, forCellReuseIdentifier: "\(DateTableViewCell.self)")
        personnelTableView.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
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

        view.backgroundColor = UIColor(red: 69/255, green: 62/255, blue: 46/255, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        view.addSubview(personnelTableView)
        setupLayout()
        
        personnelTableView.delegate = self
        personnelTableView.dataSource = self
        
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


extension PersonnelViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.personnel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = personnelTableView.dequeueReusableCell(withIdentifier: "\(DateTableViewCell.self)", for: indexPath) as? DateTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: .personnel(viewModel.personnel[indexPath.row]))
        return cell
    }
}


extension PersonnelViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showDetails = viewModel.showDetails else { return }
        showDetails(viewModel.personnel[indexPath.row])
    }
}
