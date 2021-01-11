//
//  PromotionCollectionViewDelegate.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/11/21.
//

import Foundation
import UIKit

protocol CellSelectableDelegate {
    
    func didCellSelected(_ collectionView: UICollectionView, _ didCellSelected: PromotionCollectionCellProtocol)
    func didCellDeselected(_ collectionView: UICollectionView, _ didCellDeselected: PromotionCollectionCellProtocol)
}

final class PromotionCollectionViewDelegate: NSObject, UICollectionViewDelegate {
    
    var delegate: CellSelectableDelegate?
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PromotionCollectionCellProtocol else {
            return false
        }
        if cell.isSelected {
            collectionView.deselectItem(at: indexPath, animated: true)
            delegate?.didCellSelected(collectionView, cell)
            return false
        }
        else {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
            delegate?.didCellDeselected(collectionView, cell)
            return true
        }
    }
}
