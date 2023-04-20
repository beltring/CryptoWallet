//
//  CreateWalletResultCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import UIKit
import XCoordinator

enum CreateWalletResultRoute: Route {
    case initial
    case wallet
    case alert(title: String, message: String)
    case close
}

class CreateWalletResultCoordinator: NavigationCoordinator<CreateWalletResultRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: CreateWalletResultRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = CreateWalletResultPresenter(router: unownedRouter)
            let viewController = CreateWalletResultViewController(presenter: presenter)
            viewController.modalPresentationStyle = .pageSheet
            return .push(viewController)
        case .wallet:
            let router = WalletTabBarCoordinator()
            router.rootViewController.modalPresentationStyle = .fullScreen
            return .present(router)
        case .alert(let title, let message):
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            rootViewController.modalPresentationStyle = .fullScreen
            return .present(alert)
        case .close:
            return .dismissToRoot()
        }
    }
}
