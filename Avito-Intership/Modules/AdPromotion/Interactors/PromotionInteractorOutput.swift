//
//  PromotionInteractorOutput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

protocol PromotionInteractorOutput: class {
    
    func didRetrievePromotions(_ promotions: PromotionResult)
    func didRetrieveError(_ error: NSError)
}
