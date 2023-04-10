//
//  WalletCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator

enum WalletRoute: Route {
    case wallet
    case addAccount
    case createWallet
    case settings
    case restore
    case close
}

class WalletCoordinator: NavigationCoordinator<WalletRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .wallet)
    }

    // MARK: Overrides

    override func prepareTransition(for route: WalletRoute) -> NavigationTransition {
        switch route {
        case .wallet:
            let presenter = WalletPresenter(router: unownedRouter)
            let viewController = WalletViewController(presenter: presenter)
            return .push(viewController)
        case .addAccount:
            let router = AddAccountCoordinator()
            return .present(router)
        case .createWallet:
            let router = CreateWalletCoordinator()
            return .present(router)
        case .settings:
            rootViewController.tabBarController?.selectedIndex = 2
            return .none()
        case .restore:
            let router = WalletBackUpCoordinator()
            return .present(router)
        case .close:
            return .dismissToRoot()
        }
    }
}
