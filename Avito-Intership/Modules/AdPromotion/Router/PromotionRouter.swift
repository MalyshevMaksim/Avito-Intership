//
//  RouterInput.swift
//  Avito-Tech-Intership
//
//  Created by Малышев Максим Алексеевич on 1/2/21.
//

import Foundation
import UIKit

final class PromotionRouter: BasePromotionRouter, RouterProtocol {
    
    func showSelectedPromotion(with promotion: Promotion?) {
        presentViewController { navigationController -> UIViewController in
            return assembly.buildSelectedPromotionVC(with: promotion)
        }
    }
    
    func showErrorAlert(with error: NSError) {
        presentViewController { navigationController -> UIViewController in
            return assembly.buildErrorAlert(with: error)
        }
    }
}
