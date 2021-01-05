//
//  PromotionListHeaderView.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionListViewHeader: UICollectionReusableView {
    
    static var reuseIdentifier = "PromotionListViewHeader"
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.numberOfLines = .max
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
       super.init(frame: frame)
       configure()
     }

     required init?(coder: NSCoder) {
       fatalError()
     }
    
    private func configure() {
        addSubview(label)
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
