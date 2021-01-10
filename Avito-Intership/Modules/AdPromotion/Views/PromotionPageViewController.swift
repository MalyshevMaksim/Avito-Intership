//
//  ViewController.swift
//  Avito-Intership
//
//  Created by Малышев Максим Алексеевич on 1/5/21.
//

import UIKit

final class PromotionPageViewController: UIViewController {
    
    var presenter: PromotionPresenterInput?
    private var pageView = PromotionPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        pageView.isHidden = true
        pageView.output = self
        pageView.dataSource.output = self
        presenter?.retrievePromtions()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async { [unowned self] in
            UIView.transition(with: pageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                pageView.isHidden = false
            })
        }
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

extension PromotionPageViewController: PromotionPageViewControllerInput  {
    
    func downloadImage(for promotion: Promotion) {
        presenter?.retrieveIcon(for: promotion)
    }
    
    func showIcon(icon: UIImage, for promotion: Promotion) {
        pageView.displayIcon(icon: icon, promotion: promotion)
    }

    func showPromotions(_ promotionPage: PromotionPage) {
        pageView.configure(page: promotionPage)
    }
}

extension PromotionPageViewController: PromotionPageViewControllerOutput {
   
    func didChooseButtonClicked(selectedPromotion: Promotion?) {
        presenter?.showPromotionDetail(with: selectedPromotion)
    }
    
    func provideIcon(from promotion: Promotion) {
        presenter?.retrieveIcon(for: promotion)
    }
}
