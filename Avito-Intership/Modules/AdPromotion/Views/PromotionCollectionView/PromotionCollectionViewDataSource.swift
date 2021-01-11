//
//  PromotionCollectionViewDataSource.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/11/21.
//

import Foundation
import UIKit

final class PromotionCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    weak var output: PromotionPageViewControllerOutput?
    var promotionPage: PromotionPage?
    private var cells: [String : PromotionCollectionCellProtocol] = [:]
    
    func getPromotion(at indexPath: IndexPath) -> Promotion? {
        return promotionPage?.list[indexPath.row]
    }
    
    func cellForItem(at promotion: Promotion) -> PromotionCollectionCellProtocol? {
        return cells[promotion.id]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotionPage?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier, for: indexPath) as? PromotionCollectionCellProtocol,
              let promotion = promotionPage?.list[indexPath.row] else {
            return UICollectionViewCell()
        }
        cells[promotion.id] = cell
        output?.provideIcon(from: promotion)
        cell.configure(with: promotion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let kind = PromotionCollectionView.sectionHeaderElementKind
        let reuseIdentitfier = PromotionCollectionViewHeader.reuseIdentifier
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentitfier, for: indexPath) as! PromotionCollectionViewHeader
        header.label.text = promotionPage?.title
        return header
    }
}
