//
//  PromotionListDelegate.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionListDelegate: NSObject, UICollectionViewDelegate {
        
    var del: PromotionPageDelegate?
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PromotionListCell
        
        if cell.isSelected {
            del?.didCellDeselected()
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
            
        }
        else {
            del?.didCellSelected()
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
            return true
        }
    }
}
