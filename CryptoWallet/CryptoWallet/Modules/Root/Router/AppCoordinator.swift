//
//  AppCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator

enum AppRoute: Route {
    case wallet
}

class AppCoordinator: NavigationCoordinator<AppRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .wallet)
    }

    // MARK: Overrides

    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .wallet:
            let walletTabBar = WalletTabBarCoordinator()
            walletTabBar.rootViewController.modalPresentationStyle = .fullScreen
            return .present(walletTabBar)
        }
    }
}
