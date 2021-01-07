//
//  PromotionPageViewProtocols.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/7/21.
//

import Foundation

protocol PromotionPageViewInput: class {
    func configure(page: PromotionPage)
}

protocol PromotionPageViewOutput: class {
    func didCellSelected(message: String)
}
