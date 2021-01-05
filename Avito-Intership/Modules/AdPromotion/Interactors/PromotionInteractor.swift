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
                    print("SUCCESS")
                    presenter?.didRetrievePromotions(promotions)
                case .failure(let error):
                    print("ERROR")
                    presenter?.didRetrieveError(error as NSError)
            }
        }
    }
}
