//
//  AddAccountPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import Foundation
import XCoordinator

class AddAccountPresenter {

    // MARK: - Public Properties
    public weak var view: AddAccountViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<AddAccountRoute>

    // MARK: - Init
    public init(router: UnownedRouter<AddAccountRoute>) {
        self.router = router
    }
}

// MARK: - AddAccountPresenterProtocol

extension AddAccountPresenter: AddAccountPresenterProtocol {
    func createAccount(name: String) {
        KeychainService.shared.saveAccount(name: name)
        router.trigger(.close)
    }
}
