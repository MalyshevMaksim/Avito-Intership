//
//  PromotionPageViewControllerInput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIImage

protocol PromotionPageViewControllerInput: class {
    func showPromotions(_ promotionPage: PromotionPage)
    func showIcon(icon: UIImage, for promotion: Promotion)
}

protocol PromotionPageViewControllerOutput: class {
    func provideIcon(from promotion: Promotion)
    func didChooseButtonClicked(selectedPromotion: Promotion?)
}
