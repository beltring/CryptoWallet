//
//  WalletBackUpPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 4.04.23.
//

import Foundation
import XCoordinator

class WalletBackUpPresenter {

    // MARK: - Public Properties
    public weak var view: WalletBackUpViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<WalletBackUpRoute>

    // MARK: - Init
    public init(router: UnownedRouter<WalletBackUpRoute>) {
        self.router = router
    }
}

// MARK: - AddAccountPresenterProtocol

extension WalletBackUpPresenter: WalletBackUpPresenterProtocol {
    func backUpNowButtonDidTapped() {
        print("\n MYLOG: backUpNowButtonDidTapped")
    }

    func closeButtonDidTapped() {
        router.trigger(.close)
    }
}
