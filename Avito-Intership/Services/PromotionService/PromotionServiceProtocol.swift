//
//  PromotionServiceProtocol.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

protocol PromotionServiceProtocol {
    
    func fetchPromotions(completion: @escaping (Result<PromotionResult, Error>) -> ())
    
    // Изображения передаются в Data чтобы не размазывать UIKit по всем слоям
    func fetchPicutre(for promotion: Promotion, completion: @escaping (Result<Data, Error>) -> ())
}
