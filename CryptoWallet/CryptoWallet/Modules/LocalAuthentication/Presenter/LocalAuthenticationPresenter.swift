//
//  LocalAuthenticationPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit
import XCoordinator
import Firebase
import LocalAuthentication

class LocalAuthenticationPresenter {
    // MARK: - Public Properties
    public weak var view: CreateWalletViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<LocalAuthenticationRoute>

    // MARK: - Init
    public init(router: UnownedRouter<LocalAuthenticationRoute>) {
        self.router = router
    }
}

extension LocalAuthenticationPresenter: LocalAuthenticationPresenterProtocol {
    func closeButtonDidTapped() {
    }

    func createWalletButtonDidTapped() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { [weak self] success, _ in
                if success {
                    DispatchQueue.main.async {
                        self?.router.trigger(.recoveryPhrase)
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.router.trigger(.alert(title: "Error", message: "Authentication error"))
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.router.trigger(.alert(title: "Error", message: "Authentication error"))
            }
        }
    }

    func presentErrorAlert(error: String) {
        router.trigger(.alert(title: "Error", message: error))
    }
}
