//
//  PromotionPageView.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

protocol PromotionPageDelegate {
    
    func didCellSelected()
    func didCellDeselected()
}

class PromotionPageView: UIView {
    
    var dataSource = PromotionListDataSource()
    var delegate = PromotionListDelegate()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var promotionsList: PromotionListView = {
        let promotionsList = PromotionListView()
        promotionsList.backgroundColor = .systemBackground
        promotionsList.dataSource = dataSource
        promotionsList.delegate = delegate
        promotionsList.translatesAutoresizingMaskIntoConstraints = false
        return promotionsList
    }()
    
    lazy var selectionButton: UIButton = {
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
        delegate.del = self
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(page: PromotionPage) {
        DispatchQueue.main.async { [unowned self] in
            dataSource.promotionPage = page
            selectionButton.setTitle(dataSource.promotionPage?.actionTitle, for: .normal)
            promotionsList.reloadData()
        }
    }
    
    private func setupSubviews() {
        addSubview(closeButton)
        addSubview(promotionsList)
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
            
            promotionsList.leadingAnchor.constraint(equalTo: leadingAnchor),
            promotionsList.trailingAnchor.constraint(equalTo: trailingAnchor),
            promotionsList.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: inset),
            promotionsList.bottomAnchor.constraint(equalTo: selectionButton.topAnchor),
            
            selectionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            selectionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            selectionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            selectionButton.heightAnchor.constraint(equalToConstant: 55),
            selectionButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension PromotionPageView: PromotionPageDelegate {
    
    func didCellSelected() {
        selectionButton.setTitle(dataSource.promotionPage?.selectedActionTitle, for: .normal)
    }
    
    func didCellDeselected() {
        selectionButton.setTitle(dataSource.promotionPage?.actionTitle, for: .normal)
    }
}
