//
//  AssemblyFactory.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIViewController

protocol AssemblyFactory {
    func buildModule(with service: PromotionServiceProtocol, navigation: UINavigationController) -> UIViewController
    func buildSelectedPromotionViewController(with promotion: Promotion?) -> UIViewController
    func buildErrorMessageViewController(with error: Error) -> UIViewController
}
