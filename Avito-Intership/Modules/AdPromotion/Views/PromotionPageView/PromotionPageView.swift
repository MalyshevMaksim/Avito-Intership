//
//  PromotionPageView.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionPageView: UIView, PromotionPageViewProtocol {
    
    private var displayManager = PromotionDataDisplayManager()
    var delegate: PromotionPageViewDelegate?
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var promotionCollection: PromotionListView = {
        let promotionsList = PromotionListView()
        promotionsList.backgroundColor = .systemBackground
        promotionsList.dataSource = displayManager
        promotionsList.delegate = displayManager
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
        displayManager.delegate = self
        selectionButton.addTarget(self, action: #selector(chooseButtonClicked), for: .touchUpInside)
        setupView()
    }
    
    @objc private func chooseButtonClicked() {
        guard let indexPath = promotionCollection.indexPathsForSelectedItems?.first else {
            delegate?.didChooseButtonClicked(self, with: nil)
            return
        }
        let promotion = displayManager.getPromotion(from: indexPath)
        delegate?.didChooseButtonClicked(self, with: promotion)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(page: PromotionPage) {
        DispatchQueue.main.async { [unowned self] in
            displayManager.setPromotionPage(promotion: page)
            selectionButton.setTitle(page.actionTitle, for: .normal)
            promotionCollection.reloadData()
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

extension PromotionPageView: DisplayManagerDelegate {
    
    func didCellSelected(_ displayManager: PromotionDataDisplayManager, with title: String) {
        DispatchQueue.main.async { [unowned self] in
            selectionButton.setTitle(title, for: .normal)
        }
    }
    
    func didCellDeselected(_ displayManager: PromotionDataDisplayManager, with title: String) {
        DispatchQueue.main.async { [unowned self] in
            selectionButton.setTitle(title, for: .normal)
        }
    }
}
