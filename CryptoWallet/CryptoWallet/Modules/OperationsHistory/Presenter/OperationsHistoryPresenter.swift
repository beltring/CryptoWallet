//
//  OperationsHistoryPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import Foundation
import XCoordinator

class OperationsHistoryPresenter {

    // MARK: - Public Properties
    public weak var view: AddAccountViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<HistoryRoute>

    // MARK: - Init
    public init(router: UnownedRouter<HistoryRoute>) {
        self.router = router
    }
}

// MARK: - AddAccountPresenterProtocol

extension OperationsHistoryPresenter: OperationsHistoryPresenterProtocol {
    func createAccount(name: String) {
        KeychainService.shared.saveAccount(name: name)
        router.trigger(.close)
    }
}
