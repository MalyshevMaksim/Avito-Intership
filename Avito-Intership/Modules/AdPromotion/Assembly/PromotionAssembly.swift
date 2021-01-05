//
//  PromotionAssembly.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIViewController

class PromotionAssembly: AssemblyFactory {
    
    func buildModule(with service: PromotionServiceProtocol) -> UIViewController {
        
        let view = PromotionPageViewController()
        let interactor = PromotionInteractor(service: service)
        let presenter = PromotionPresenter(interactor: interactor)
        presenter.view = view
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
