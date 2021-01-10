//
//  PromotionCollectionViewDataSource.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/11/21.
//

import Foundation
import UIKit

protocol Cellable {
    
    func didCellSelected(_ displayManager: PromotionCollectionViewDelegate)
    func didCellDeselected(_ displayManager: PromotionCollectionViewDelegate)
}

final class PromotionCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    weak var output: PromotionPageViewControllerOutput?
    var promotionPage: PromotionPage?
    private var cells: [String : PromotionListCellProtocol] = [:]
    
    func getPromotion(at indexPath: IndexPath) -> Promotion? {
        return promotionPage?.list[indexPath.row]
    }
    
    func cellForItem(at promotion: Promotion) -> PromotionListCellProtocol? {
        return cells[promotion.id]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotionPage?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionListCell.reuseIdentifier, for: indexPath) as? PromotionListCellProtocol,
              let promotion = promotionPage?.list[indexPath.row] else {
            return UICollectionViewCell()
        }
        cells[promotion.id] = cell
        output?.provideIcon(from: promotion)
        cell.configure(with: promotion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let kind = PromotionListView.sectionHeaderElementKind
        let reuseIdentitfier = PromotionListViewHeader.reuseIdentifier
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentitfier, for: indexPath) as! PromotionListViewHeader
        header.label.text = promotionPage?.title
        return header
    }
}
