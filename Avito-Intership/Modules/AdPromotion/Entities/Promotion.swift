//
//  Promotion.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

struct Promotion: Codable {
    var id: String
    var title: String
    var description: String?
    var price: String
    var icon: PromotionIcon
    var isSelected: Bool
}

struct PromotionIcon: Codable {
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case url = "52x52"
    }
}
