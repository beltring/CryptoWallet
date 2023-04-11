//
//  PrivacyPolicyPresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import Foundation
import XCoordinator

class PrivacyPolicyPresenter {
    // MARK: - Public Properties
    public weak var view: PrivacyPolicyViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<PrivacyPolicyRoute>

    // MARK: - Init
    public init(router: UnownedRouter<PrivacyPolicyRoute>) {
        self.router = router
    }
}

extension PrivacyPolicyPresenter: PrivacyPolicyPresenterProtocol {
    func backButtonDidTapped() {
        router.trigger(.close)
    }
}
