//
//  PromotionPageViewControllerInput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIImage

protocol PromotionViewInput: class {
    func showPromotions(_ promotionPage: PromotionPage)
}

protocol PromotionViewOutput: class {
    func retrievePromtions()
    func showSelectedPromotion(from indexPath: IndexPath?)
}
