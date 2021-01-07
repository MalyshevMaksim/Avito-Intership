//
//  ViewController.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit

final class PromotionPageViewController: UIViewController {
    
    var presenter: PromotionViewOutput?
    var pageView = PromotionPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        presenter?.retrievePromtions()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PromotionPageViewController: PromotionViewInput {
    
    func showPromotions(_ promotionPage: PromotionPage) {
        pageView.configure(page: promotionPage)
    }
}
