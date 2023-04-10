//
//  LocalAuthenticationCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit
import XCoordinator

enum LocalAuthenticationRoute: Route {
    case initial
    case alert(title: String, message: String)
    case recoveryPhrase
    case close
}

class LocalAuthenticationCoordinator: NavigationCoordinator<LocalAuthenticationRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: LocalAuthenticationRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = LocalAuthenticationPresenter(router: unownedRouter)
            let viewController = LocalAuthenticationViewController(presenter: presenter)
//            viewController.modalPresentationStyle = .pageSheet
            return .push(viewController)
        case .alert(let title, let message):
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            rootViewController.modalPresentationStyle = .fullScreen
            return .present(alert)
        case .recoveryPhrase:
            let router = RecoveryPhraseCoordinator()
            return .present(router)
        case .close:
            return .dismiss()
        }
    }
}
