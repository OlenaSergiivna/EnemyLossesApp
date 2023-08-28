//
//  EquipmentDetailsViewController.swift
//  EnemyLossesApp
//
//  Created by user on 26.08.2023.
//

import UIKit

class EquipmentDetailsViewController: UIViewController {
    
    private let viewModel: EquipmentDetailsViewModel
    
    let detailsView = EquipmentDetailsView()
    
    var detailsCollectionView: UICollectionView!
    
    public init(viewModel: EquipmentDetailsViewModel) {
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
        detailsView.configure(with: viewModel.equipmenData)

        setUpTableView()
        setUpConstraints()
    }
    
    func setUpTableView() {
        detailsCollectionView = detailsView.detailedEquipmentLossesCollectionView
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        detailsCollectionView.register(EquipmentDataCollectionViewCell.self, forCellWithReuseIdentifier: "\(EquipmentDataCollectionViewCell.self)")
        
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


extension EquipmentDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.equipmentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = detailsCollectionView?.dequeueReusableCell(withReuseIdentifier: "\(EquipmentDataCollectionViewCell.self)", for: indexPath) as? EquipmentDataCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: viewModel.equipmentArray[indexPath.row])
        
        return cell
    }
}


extension EquipmentDetailsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (detailsCollectionView.frame.size.width / 2) - 16, height: 40)
    }
}
