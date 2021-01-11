//
//  PromotionPageView.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionPageView: UIView, PromotionPageViewProtocol {
    
    weak var output: PromotionPageViewControllerOutput?
    var delegate = PromotionCollectionViewDelegate()
    var dataSource = PromotionCollectionViewDataSource()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promotionCollection: PromotionCollectionView = {
        let promotionsList = PromotionCollectionView()
        promotionsList.backgroundColor = .systemBackground
        promotionsList.dataSource = dataSource
        promotionsList.delegate = delegate
        promotionsList.translatesAutoresizingMaskIntoConstraints = false
        return promotionsList
    }()
    
    private lazy var selectionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3019607843, green: 0.6705882353, blue: 1, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate.delegate = self
        selectionButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func chooseButtonClicked() {
        guard let indexPath = promotionCollection.indexPathsForSelectedItems?.first else {
            output?.didChooseButtonClicked(selectedPromotion: nil)
            return
        }
        let promotion = dataSource.getPromotion(at: indexPath)
        output?.didChooseButtonClicked(selectedPromotion: promotion)
    }
    
    func configure(page: PromotionPage) {
        DispatchQueue.main.async { [unowned self] in
            dataSource.promotionPage = page
            selectionButton.setTitle(page.actionTitle, for: .normal)
            promotionCollection.reloadData()
        }
    }
    
    func displayIcon(icon: UIImage, promotion: Promotion) {
        DispatchQueue.main.async { [unowned self] in
            let cell = dataSource.cellForItem(at: promotion)
            cell?.displayIcon(icon)
        }
    }
    
    private func setupSubviews() {
        addSubview(closeButton)
        addSubview(promotionCollection)
        addSubview(selectionButton)
    }
    
    func setupView() {
        setupSubviews()
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 28),
            closeButton.heightAnchor.constraint(equalToConstant: 28),
            
            promotionCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            promotionCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            promotionCollection.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: inset * 2),
            promotionCollection.bottomAnchor.constraint(equalTo: selectionButton.topAnchor),
            
            selectionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            selectionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectionButton.heightAnchor.constraint(equalToConstant: 55),
            selectionButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension PromotionPageView: CellSelectableDelegate {
    
    func didCellSelected(_ collectionView: UICollectionView, _ didCellSelected: PromotionCollectionCellProtocol) {
        DispatchQueue.main.async { [unowned self] in
            selectionButton.setTitle(dataSource.promotionPage?.actionTitle, for: .normal)
        }
    }
    
    func didCellDeselected(_ collectionView: UICollectionView, _ didCellDeselected: PromotionCollectionCellProtocol) {
        DispatchQueue.main.async { [unowned self] in
            selectionButton.setTitle(dataSource.promotionPage?.selectedActionTitle, for: .normal)
        }
    }
}
