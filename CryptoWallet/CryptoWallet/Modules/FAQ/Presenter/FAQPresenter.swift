//
//  FAQPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import Foundation
import XCoordinator

class FAQPresenter {

    // MARK: - Public Properties

    public weak var view: FAQViewProtocol?

    // MARK: - Private Properties

    private let faqItems = FAQ.allCases
    private let router: UnownedRouter<FAQRoute>

    // MARK: - Init
    public init(router: UnownedRouter<FAQRoute>) {
        self.router = router
    }
}

// MARK: - FAQPresenterProtocol

extension FAQPresenter: FAQPresenterProtocol {
    func backButtonDidTapped() {
        router.trigger(.close)
    }

    func getFAQCount() -> Int {
        return faqItems.count
    }

    func getFAQ(index: Int) -> FAQ {
        return faqItems[index]
    }
}
