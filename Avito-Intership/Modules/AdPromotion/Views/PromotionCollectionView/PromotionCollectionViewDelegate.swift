//
//  PromotionCollectionViewDelegate.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/11/21.
//

import Foundation
import UIKit

final class PromotionCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var delegate: Cellable?
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionListCellProtocol else {
            return false
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            delegate?.didCellSelected(self)
            return false
        }
        else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            delegate?.didCellDeselected(self)
            return true
        }
    }
}
