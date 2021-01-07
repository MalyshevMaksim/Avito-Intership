//
//  PromotionPresenter.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit.UIImage

final class PromotionPresenter: PromotionPresenterInput {
    
    weak var view: PromotionViewInput?
    private var interactor: PromotionInteractorInput
    private var router: RouterInput
    
    private var receivedPromotions: PromotionPage!
    
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
    
    func providePromotion(from indexPath: IndexPath) -> Promotion? {
        return receivedPromotions?.list[indexPath.row]
    }
    
    func provideIcon(for promotion: Promotion) -> UIImage {
        guard let icon = receivedIcons[promotion.id] else {
            interactor.retrieveIcon(for: promotion)
            return UIImage(named: "checkmark")!
        }
        return icon
    }
    
    func provideNumberOfPromotions() -> Int {
        guard let promotions = receivedPromotions else {
            return 0
        }
        return promotions.list.count
    }
    
    func provideButtonTitle(isSelected: Bool) -> String {
        if isSelected {
            return receivedPromotions.actionTitle
        }
        else {
            return receivedPromotions.selectedActionTitle
        }
    }
    
    func providePageTitle() -> String {
        return receivedPromotions.title
    }
}

extension PromotionPresenter: PromotionViewOutput {
    
    func retrievePromtions() {
        interactor.retrievePromotions()
    }
    
    func showSelectedPromotion(from indexPath: IndexPath?) {
        guard let indexPath = indexPath else {
            showPromotionDetail(with: nil)
            return
        }
        let promotion = receivedPromotions?.list[indexPath.row]
        showPromotionDetail(with: promotion)
    }
}

extension PromotionPresenter: PromotionInteractorOutput {
    
    func didRetrieveIcon(_ icon: UIImage, for promotion: Promotion) {
        receivedIcons[promotion.id] = icon
    }
    
    func didRetrievePromotions(_ promotions: PromotionResult) {
        receivedPromotions = promotions.result
        view?.showPromotions(promotions.result)
    }
    
    func didRetrieveError(_ error: NSError) {
        showErrorAlert(with: error)
    }
}
