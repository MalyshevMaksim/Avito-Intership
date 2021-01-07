//
//  PromotionDataDisplayManager.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/7/21.
//

import Foundation
import UIKit

final class PromotionDataDisplayManager: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var presenter: PromotionPresenterInput!
    var output: PromotionPageViewOutput?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.provideNumberOfPromotions()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let reuseIdentitfier = PromotionListCell.reuseIdentifier
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentitfier, for: indexPath) as? PromotionListCellProtocol,
              let promotion = presenter.providePromotion(from: indexPath) else {
            return UICollectionViewCell()
        }
        let icon = presenter.provideIcon(for: promotion)
        cell.displayIcon(icon)
        cell.configure(with: promotion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let kind = PromotionListView.sectionHeaderElementKind
        let reuseIdentitfier = PromotionListViewHeader.reuseIdentifier
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentitfier, for: indexPath) as! PromotionListViewHeader
        
        header.label.text = presenter.providePageTitle()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionListCellProtocol else {
            return false
        }
        
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            output?.didCellSelected(message: presenter.provideButtonTitle(isSelected: true))
            return false
        }
        else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            output?.didCellSelected(message: presenter.provideButtonTitle(isSelected: false))
            return true
        }
    }
}
