//
//  CreateWalletResultPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import Foundation
import XCoordinator

class CreateWalletResultPresenter {
    // MARK: - Public Properties
    public weak var view: CreateWalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<CreateWalletResultRoute>

    // MARK: - Init
    public init(router: UnownedRouter<CreateWalletResultRoute>) {
        self.router = router
    }
}

extension CreateWalletResultPresenter: CreateWalletResultPresenterProtocol {
    func doneButtonDidTapped() {
        router.trigger(.wallet)
    }
}
