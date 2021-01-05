//
//  PromotionServiceProtocol.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit.UIImage

protocol PromotionServiceProtocol {
    
    func fetchPromotions(completion: @escaping (Result<PromotionResult, Error>) -> ())
    func fetchPicutre(for promotion: Promotion, completion: @escaping (Result<UIImage, Error>) -> ())
}
