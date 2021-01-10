//
//  PromotionInteractor.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

final class PromotionInteractor: PromotionInteractorInput {
        
    weak var presenter: PromotionInteractorOutput?
    private var service: PromotionServiceProtocol
    
    // Словарь хранит соответствие id объявления и его иконки (в Data, чтобы не размазывать UIKit по всем слоям)
    // Используется как простой in memory кеш
    private var receivedIconData: [String : Data] = [:]
    
    init(service: PromotionServiceProtocol) {
        self.service = service
    }
    
    func retrievePromotions() {
        service.fetchPromotions() { [unowned self] (result: Result<PromotionResult, Error>) in
            switch result {
                case .success(let promotions):
                    presenter?.didRetrievePromotions(promotions)
                case .failure(let error):
                    presenter?.didRetrieveError(error as NSError)
            }
        }
    }
    
    func retrieveIcon(for promotion: Promotion) {
        if let iconData = receivedIconData[promotion.id] {
            presenter?.didRetrieveIcon(iconData, for: promotion)
            return
        }
        service.fetchPicutre(for: promotion) { [unowned self] result in
            switch result {
                case .success(let iconData):
                    receivedIconData[promotion.id] = iconData
                    presenter?.didRetrieveIcon(iconData, for: promotion)
                case .failure(let error):
                    presenter?.didRetrieveError(error as NSError)
            }
        }
    }
}
