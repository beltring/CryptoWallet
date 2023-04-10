//
//  RecoveryPhraseCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 10.04.23.
//

import UIKit
import XCoordinator

enum RecoveryPhraseRoute: Route {
    case initial
    case alert(title: String, message: String)
    case close
}

class RecoveryPhraseCoordinator: NavigationCoordinator<RecoveryPhraseRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: RecoveryPhraseRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = RecoveryPhrasePresenter(router: unownedRouter)
            let viewController = RecoveryPhraseViewController(presenter: presenter)
            return .push(viewController)
        case .alert(let title, let message):
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            rootViewController.modalPresentationStyle = .fullScreen
            return .present(alert)
        case .close:
            return .dismiss()
        }
    }
}
