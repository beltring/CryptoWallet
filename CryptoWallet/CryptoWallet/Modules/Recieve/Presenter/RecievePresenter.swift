//
//  RecievePresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 20.04.23.
//

import Foundation
import XCoordinator

class RecievePresenter {

    // MARK: - Public Properties

    public weak var view: FAQViewProtocol?

    // MARK: - Private Properties

    private let router: UnownedRouter<RecieveRoute>

    // MARK: - Init
    public init(router: UnownedRouter<RecieveRoute>) {
        self.router = router
    }
}

// MARK: - FAQPresenterProtocol

extension RecievePresenter: RecievePresenterProtocol {
    func backButtonDidTapped() {
        router.trigger(.close)
    }
}
