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
    
    func retrievePromtions()
    func retrieveIcon(for promotion: Promotion) -> UIImage
}
