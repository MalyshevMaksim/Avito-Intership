//
//  PromotionDisplayManagerProtocols.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/8/21.
//

import Foundation

protocol DisplayManagerProtocol: class {
    
    func setPromotionPage(promotion page: PromotionPage)
    func getPromotion(from indexPath: IndexPath) -> Promotion?
}

protocol DisplayManagerDelegate: class {
    
    func didCellSelected(_ displayManager: PromotionDataDisplayManager, with title: String)
    func didCellDeselected(_ displayManager: PromotionDataDisplayManager, with title: String)
}
