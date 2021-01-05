//
//  AssemblyFactory.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIViewController

protocol AssemblyFactory {

    func buildModule(with service: PromotionServiceProtocol) -> UIViewController
    func buildSelectedPromotionVC(with promotion: Promotion?) -> UIViewController
    func buildErrorAlert(with error: Error) -> UIViewController
}
