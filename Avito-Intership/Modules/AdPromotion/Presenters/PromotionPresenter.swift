//
//  PromotionPresenter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit.UIImage

final class PromotionPresenter: PromotionPresenterInput {
    
    weak var view: PromotionPageViewControllerInput?
    private var interactor: PromotionInteractorInput
    private var router: RouterInput
    
    init(interactor: PromotionInteractorInput, router: RouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    func showPromotionDetail(with promotion: Promotion?) {
        router.showPromotionDetail(with: promotion)
    }
    
    func showErrorAlert(with error: NSError) {
        router.showErrorAlert(with: error)
    }
    
    func retrievePromtions() {
        interactor.retrievePromotions()
    }
    
    func retrieveIcon(for promotion: Promotion) {
        interactor.retrieveIcon(for: promotion)
    }
}

extension PromotionPresenter: PromotionInteractorOutput {
    
    func didRetrieveIcon(_ iconData: Data, for promotion: Promotion) {
        guard let icon = UIImage(data: iconData) else {
            showErrorAlert(with: RemoteError.badData as NSError)
            return
        }
        view?.showIcon(icon: icon, for: promotion)
    }
    
    func didRetrievePromotions(_ promotions: PromotionResult) {
        view?.showPromotions(promotions.result)
    }
    
    func didRetrieveError(_ error: NSError) {
        showErrorAlert(with: error)
    }
}
