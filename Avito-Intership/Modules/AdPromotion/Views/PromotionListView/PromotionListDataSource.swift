//
//  PromotionListDataSource.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionListDataSource: NSObject, UICollectionViewDataSource {
    
    var promotionPage: PromotionPage?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promotionPage?.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = PromotionListCell.reuseIdentifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PromotionListCellProtocol, let promotion = promotionPage?.list[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.configure(with: promotion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: PromotionListView.sectionHeaderElementKind, withReuseIdentifier: PromotionListViewHeader.reuseIdentifier, for: indexPath) as! PromotionListViewHeader
        header.label.text = promotionPage?.title
        return header
    }
}
