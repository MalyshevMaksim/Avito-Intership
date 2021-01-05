//
//  PromotionPresenterInput.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

protocol PromotionPresenterInput: class {
    
    func retrievePromotions()
    func showAlert(with promotion: Promotion?)
}
