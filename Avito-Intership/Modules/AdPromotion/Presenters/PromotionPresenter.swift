//
//  PromotionPresenter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit.UIImage

final class PromotionPresenter: PromotionPresenterInput {
    
    weak var view: PromotionPageViewControllerProtocol?
    private var interactor: PromotionInteractorInput
    private var router: RouterInput
    
    // Словарь хранит соответствие id объявления и его иконки
    private var receivedIcons: [String : UIImage] = [:]
    
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
    
    func retrieveIcon(for promotion: Promotion) -> UIImage {
        guard let icon = receivedIcons[promotion.id] else {
            interactor.retrieveIcon(for: promotion)
            return UIImage(named: "checkmark")!
        }
        return icon
    }
}

extension PromotionPresenter: PromotionInteractorOutput {
    
    func didRetrieveIcon(_ icon: UIImage, for promotion: Promotion) {
        receivedIcons[promotion.id] = icon
    }
    
    func didRetrievePromotions(_ promotions: PromotionResult) {
        view?.showPromotions(promotions.result)
    }
    
    func didRetrieveError(_ error: NSError) {
        showErrorAlert(with: error)
    }
}
