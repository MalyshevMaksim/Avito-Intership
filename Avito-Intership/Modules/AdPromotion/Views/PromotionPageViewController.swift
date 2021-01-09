//
//  ViewController.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit

final class PromotionPageViewController: UIViewController {
    
    private var pageView = PromotionPageView()
    var presenter: PromotionPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        pageView.delegate = self
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

extension PromotionPageViewController: PromotionPageViewDelegate {
    
    func didChooseButtonClicked(_ promotionPageView: PromotionPageView, with selectedPromotion: Promotion?) {
        presenter?.showPromotionDetail(with: selectedPromotion)
    }
}

extension PromotionPageViewController: PromotionPageViewControllerProtocol {
    
    func showPromotions(_ promotionPage: PromotionPage) {
        pageView.configure(page: promotionPage)
    }
}
