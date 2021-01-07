//
//  RemotePromotionService.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation
import UIKit.UIImage

final class RemotePromotionService: PromotionServiceProtocol {
    
    func fetchPromotions(completion: @escaping (Result<PromotionResult, Error>) -> ()) {
        
        guard let url = Bundle.main.url(forResource: "result", withExtension: "json") else {
            completion(.failure(RemoteError.badUrl(reason: "")))
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            completion(.failure(RemoteError.badData(reason: "")))
            return
        }
        guard let converted = decode(from: data) else {
            completion(.failure(RemoteError.badDecode(reason: "")))
            return
        }
        completion(.success(converted))
    }
    
    private func decode(from data: Data) -> PromotionResult? {
        
        do {
            let converted = try JSONDecoder().decode(PromotionResult.self, from: data)
            return converted
        } catch {
            return nil
        }
    }
    
    func fetchPicutre(for promotion: Promotion, completion: @escaping (Result<UIImage, Error>) -> ()) {
        
        guard let url = URL(string: promotion.icon.url) else {
            completion(.failure(RemoteError.badUrl(reason: "")))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(RemoteError.badResponse(reason: "")))
                return
            }
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(RemoteError.badStatusCode(reason: "")))
                return
            }
            guard let data = data else {
                completion(.failure(RemoteError.badData(reason: "")))
                return
            }
            guard let picture = UIImage(data: data) else {
                completion(.failure(RemoteError.badDecode(reason: "")))
                return
            }
            completion(.success(picture))
        }
        dataTask.resume()
    }
}
