//
//  PromotionPageViewProtocols.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/7/21.
//

import Foundation
import UIKit.UIImage

protocol PromotionPageViewProtocol: class {
    func configure(page: PromotionPage)
}

protocol PromotionPageViewDelegate: class {
    func didChooseButtonClicked(_ promotionPageView: PromotionPageView, with selectedPromotion: Promotion?)
}
