//
//  PromotionListCell.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

protocol PromotionListCellProtocol: UICollectionViewCell {
    
    func configure(with promotion: Promotion)
}

final class PromotionListCell: UICollectionViewCell, PromotionListCellProtocol {
    
    static var reuseIdentifier = "PromotionListCell"

    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.layer.cornerRadius = 14
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var checkmark: UIImageView = {
        let icon = UIImageView()
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 12
        icon.image = UIImage(named: "checkmark")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        let example = NSAttributedString(string: "1").withLineSpacing(2)
        label.attributedText = example
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with promotion: Promotion) {
        DispatchQueue.main.async { [unowned self] in
            titleLabel.text = promotion.title
            priceLabel.text = promotion.price
            descriptionLabel.text = promotion.description
        
            checkmark.isHidden = !isSelected
        }
        
        let service = RemotePromotionService()
        
        service.fetchPicutre(for: promotion) { result in
            switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.icon.image = image
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    private func setupSubviews() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 5
        contentView.addSubview(verticalStackView)
        contentView.addSubview(icon)
        contentView.addSubview(checkmark)
    }
    
    private func setupCell() {
        setupSubviews()
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            icon.heightAnchor.constraint(equalToConstant: 55),
            icon.widthAnchor.constraint(equalToConstant: 55),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            
            checkmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            checkmark.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            checkmark.heightAnchor.constraint(equalToConstant: 24),
            checkmark.widthAnchor.constraint(equalToConstant: 24),
            
            verticalStackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: inset),
            verticalStackView.trailingAnchor.constraint(equalTo: checkmark.leadingAnchor, constant: -inset),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            contentView.bottomAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: inset)
        ])
    }
    
    override var isSelected: Bool {
        didSet {
            isSelected ? showCheckmark() : hideCheckmark()
        }
    }
    
    func showCheckmark() {
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.15, options: .transitionCrossDissolve, animations: {
                self.checkmark.isHidden = false
            })
        }
    }
    
    func hideCheckmark() {
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.15, options: .transitionCrossDissolve, animations: {
                self.checkmark.isHidden = true
            })
        }
    }
}
