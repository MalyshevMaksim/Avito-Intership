//
//  BasePromotionRouter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit

protocol RouterInput {
    
    func showPromotionDetail(with promotion: Promotion?)
    func showErrorAlert(with error: NSError)
}

class BasePromotionRouter {
    
    weak var navigationController: UINavigationController?
    var assembly: AssemblyFactory
    
    init(assembly: AssemblyFactory) {
        self.assembly = assembly
    }
    
    func presentViewController(deriveViewController: (UINavigationController) -> UIViewController) {
        if let navigationController = navigationController {
            let viewController = deriveViewController(navigationController)
            navigationController.present(viewController, animated: true, completion: nil)
        }
    }
}
