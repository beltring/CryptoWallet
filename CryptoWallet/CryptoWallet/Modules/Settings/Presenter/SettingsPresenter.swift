//
//  SettingsPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import Foundation
import XCoordinator

class SettingsPresenter {
    // MARK: - Public Properties
    public weak var view: SettingsViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<SettingsRoute>

    // MARK: - Init
    public init(router: UnownedRouter<SettingsRoute>) {
        self.router = router
    }
}

// MARK: - SettingsPresenterProtocol

extension SettingsPresenter: SettingsPresenterProtocol {
    func faqButtonDidTapped() {
        router.trigger(.faq)
    }

    func privacyPolicyButtonDidTapped() {
        router.trigger(.privacyPolicy)
    }
}
