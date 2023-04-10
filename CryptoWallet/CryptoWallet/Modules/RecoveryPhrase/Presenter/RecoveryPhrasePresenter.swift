//
//  RecoveryPhrasePresenter.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 10.04.23.
//

import Foundation
import XCoordinator

class RecoveryPhrasePresenter {
    // MARK: - Public Properties
    public weak var view: RecoveryPhraseViewProtocol?

    // MARK: - Private Properties
    private let router: UnownedRouter<RecoveryPhraseRoute>

    // MARK: - Init
    public init(router: UnownedRouter<RecoveryPhraseRoute>) {
        self.router = router
    }
}

extension RecoveryPhrasePresenter: RecoveryPhrasePresenterProtocol {
    func backButtonDidTapped() {
        router.trigger(.close)
    }

    func nextButtonDidTapped() {
        print("\n MYLOG: nextButtonDidTapped")
    }

    func presentErrorAlert(error: String) {
        print("\n MYLOG: presentErrorAlert")
    }
}
