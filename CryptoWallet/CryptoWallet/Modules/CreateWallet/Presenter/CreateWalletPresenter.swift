//
//  CreateWalletPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit
import XCoordinator

class CreateWalletPresenter {
    // MARK: - Public Properties
    public weak var view: CreateWalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<CreateWalletRoute>

    // MARK: - Init
    public init(router: UnownedRouter<CreateWalletRoute>) {
        self.router = router
    }
}

extension CreateWalletPresenter: CreateWalletPresenterProtocol {
    func closeButtonDidTapped() {
//        router.trigger(., with: <#T##TransitionOptions#>)
    }

    func createWalletButtonDidTapped() {
        router.trigger(.close)
    }
}
