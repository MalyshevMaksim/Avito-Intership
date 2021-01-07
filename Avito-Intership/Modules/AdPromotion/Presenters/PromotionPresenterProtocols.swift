//
//  PromotionPresenterInput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation.NSError
import UIKit

protocol PromotionPresenterInput {
    
    func showPromotionDetail(with promotion: Promotion?)
    func showErrorAlert(with error: NSError)
    
    func provideIcon(for promotion: Promotion) -> UIImage
    func providePromotion(from indexPath: IndexPath) -> Promotion?
    
    func provideNumberOfPromotions() -> Int
    func provideButtonTitle(isSelected: Bool) -> String
    func providePageTitle() -> String
}
