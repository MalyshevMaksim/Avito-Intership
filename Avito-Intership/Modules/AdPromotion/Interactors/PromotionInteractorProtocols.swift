//
//  PromotionInteractorInput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIImage
import Foundation.NSError

protocol PromotionInteractorInput: class {
    func retrievePromotions()
    func retrieveIcon(for promotion: Promotion)
}

protocol PromotionInteractorOutput: class {
    func didRetrievePromotions(_ promotions: PromotionResult)
    func didRetrieveIcon(_ icon: UIImage, for promotion: Promotion)
    func didRetrieveError(_ error: NSError)
}
