//
//  PromotionPresenter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

final class PromotionPresenter: PromotionPresenterInput {
    
    weak var view: PromotionPageViewControllerInput?
    private var interactor: PromotionInteractorInput
    private var router: RouterProtocol
    
    init(interactor: PromotionInteractorInput, router: RouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func retrievePromotions() {
        interactor.retrievePromotions()
    }
    
    func showAlert(with promotion: Promotion?) {
        router.showSelectedPromotion(with: promotion)
    }
}

extension PromotionPresenter: PromotionInteractorOutput {
    
    func didRetrievePromotions(_ promotions: PromotionResult) {
        view?.providePromotions(promotions.result)
    }
    
    func didRetrieveError(_ error: NSError) {
        router.showErrorAlert(with: error)
    }
}
