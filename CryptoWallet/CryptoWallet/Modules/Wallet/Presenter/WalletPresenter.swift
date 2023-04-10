//
//  WalletPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator
import Firebase

class WalletPresenter {
    // MARK: - Public Properties
    public weak var view: WalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<WalletRoute>

    // MARK: - Init
    public init(router: UnownedRouter<WalletRoute>) {
        self.router = router
    }
}

extension WalletPresenter: WalletPresenterProtocol {
    func addAccountCardDidPressed() {
        //        router.trigger(.addAccount)
        router.trigger(.createWallet)
    }

    func settingsButtonDidPressed() {
        router.trigger(.settings)
    }

    func restoreButtonDidPressed() {
        router.trigger(.restore)
    }
}
