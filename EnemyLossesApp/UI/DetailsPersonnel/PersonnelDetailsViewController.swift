//
//  PersonnelDetailsViewController.swift
//  EnemyLossesApp
//
//  Created by user on 27.08.2023.
//

import UIKit

class PersonnelDetailsViewController: UIViewController {
    
    private let viewModel: PersonnelDetailsViewModel
    
    let detailsView = PersonnelDetailsView()
    
    public init(viewModel: PersonnelDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = GlobalColor.darkMilitary
        
        view.addSubview(detailsView)
        detailsView.configure(with: viewModel.personnelData)
        setUpConstraints()
    }
    
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
