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
        presenter?.retrievePromotions()
        setupPageView()
    }
    
    private func setupPageView() {
        view.addSubview(pageView)
        pageView.selectionButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func tap() {
        guard let selectedCellIndex = pageView.promotionsList.indexPathsForSelectedItems?.first?.row else {
            presenter?.showAlert(with: nil)
            return
        }
        presenter?.showAlert(with: pageView.dataSource.promotionPage?.list[selectedCellIndex])
    }
}

extension PromotionPageViewController: PromotionPageViewControllerInput {
    
    func providePromotions(_ promotionPage: PromotionPage) {
        pageView.configure(page: promotionPage)
    }
}
