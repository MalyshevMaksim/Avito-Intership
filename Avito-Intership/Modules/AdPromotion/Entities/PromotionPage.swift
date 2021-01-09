//
//  PromotionPage.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import Foundation

struct PromotionPage: Codable {
    var title: String
    var actionTitle: String
    var selectedActionTitle: String
    var list: [Promotion]
}
