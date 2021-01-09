//
//  PromotionAssembly.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIViewController

final class PromotionAssembly: AssemblyFactory {
    
    func buildModule(with service: PromotionServiceProtocol, navigation: UINavigationController) -> UIViewController {
        let view = PromotionPageViewController()
        let interactor = PromotionInteractor(service: service)
        let router = PromotionRouter(assembly: self)
        let presenter = PromotionPresenter(interactor: interactor, router: router)
        presenter.view = view
        interactor.presenter = presenter
        view.presenter = presenter
        router.navigationController = navigation
        navigation.viewControllers = [view]
        return navigation
    }
    
    func buildSelectedPromotionViewController(with promotion: Promotion?) -> UIViewController {
        var alert: UIAlertController
        
        if let promotion = promotion {
            alert = UIAlertController(title: promotion.title, message: "Цена: \(promotion.price)", preferredStyle: .alert)
        }
        else {
            alert = UIAlertController(title: "Услуга не выбрана", message: nil, preferredStyle: .alert)
        }
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
    func buildErrorMessageViewController(with error: Error) -> UIViewController {
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
}
