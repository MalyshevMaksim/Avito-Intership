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
    
    init(interactor: PromotionInteractorInput) {
        self.interactor = interactor
    }
    
    func retrievePromotions() {
        interactor.retrievePromotions()
    }
    
    func showAlert(with promotion: Promotion?) {
        
    }
}

extension PromotionPresenter: PromotionInteractorOutput {
    
    func didRetrievePromotions(_ promotions: PromotionResult) {
        print(promotions)
    }
    
    func didRetrieveError(_ error: NSError) {
        
    }
}
