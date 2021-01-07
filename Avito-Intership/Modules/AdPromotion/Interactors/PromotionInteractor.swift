//
//  PromotionInteractor.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit.UIImage

final class PromotionInteractor: PromotionInteractorInput {
        
    weak var presenter: PromotionInteractorOutput?
    private var service: PromotionServiceProtocol
    
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
        service.fetchPicutre(for: promotion) { [unowned self] result in
            switch result {
                case .success(let icon):
                    presenter?.didRetrieveIcon(icon, for: promotion)
                case .failure(let error):
                    presenter?.didRetrieveError(error as NSError)
            }
        }
    }
}
