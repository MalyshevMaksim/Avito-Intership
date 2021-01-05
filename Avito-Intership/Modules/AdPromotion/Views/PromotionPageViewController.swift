//
//  ViewController.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit

class PromotionPageViewController: UIViewController {
    
    var presenter: PromotionPresenterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.retrievePromotions()
    }
}


extension PromotionPageViewController: PromotionPageViewControllerInput {
    
    func providePromotions(_ promotionPage: PromotionPage) {
        print("Provide")
    }
}
