//
//  WalletPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator
import Firebase
import HdWalletKit

class WalletPresenter {
    // MARK: - Public Properties
    public weak var view: WalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<WalletRoute>

    private var words = UserDefaultsService.shared.getWords().components(separatedBy: .whitespaces)

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

    func recieveButtonDidPressed() {
        router.trigger(.recieve)
    }

    func loginIfNeeded() {
        do {
            try Mnemonic.validate(words: words)

            try WalletManager.shared.login(words: words)

            view?.setupWallet()
        } catch {
            router.trigger(.alert(title: "Error", message: "Login Error"))
        }
    }

    func getWords() -> String {
        UserDefaultsService.shared.getWords()
    }

    func showErrorAlert(title: String, message: String) {
        router.trigger(.alert(title: title, message: message))
    }
}
