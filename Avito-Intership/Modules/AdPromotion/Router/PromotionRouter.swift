//
//  PromotionRouter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

final class PromotionRouter: BasePromotionRouter, RouterInput {
    
    func showPromotionDetail(with promotion: Promotion?) {
        presentViewController { navigationController -> UIViewController in
            return assembly.buildSelectedPromotionViewController(with: promotion)
        }
    }
    
    func showErrorAlert(with error: NSError) {
        presentViewController { navigationController -> UIViewController in
            return assembly.buildErrorMessageViewController(with: error)
        }
    }
}
