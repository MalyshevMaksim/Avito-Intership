//
//  PromotionDataDisplayManager.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/7/21.
//

import Foundation
import UIKit

final class PromotionDataDisplayManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, DisplayManagerProtocol {
    
    private var promotionPage: PromotionPage?
    var delegate: DisplayManagerDelegate?
    
    func setPromotionPage(promotion page: PromotionPage) {
        self.promotionPage = page
    }
    
    func getPromotion(from indexPath: IndexPath) -> Promotion? {
        return promotionPage?.list[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotionPage?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentitfier = PromotionListCell.reuseIdentifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentitfier, for: indexPath) as? PromotionListCellProtocol,
              let promotion = promotionPage?.list[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.displayIcon(UIImage(named: "checkmark")!)
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
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionListCellProtocol else {
            return false
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            delegate?.didCellSelected(self, with: promotionPage?.actionTitle ?? "")
            return false
        }
        else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            delegate?.didCellDeselected(self, with: promotionPage?.selectedActionTitle ?? "")
            return true
        }
    }
}
