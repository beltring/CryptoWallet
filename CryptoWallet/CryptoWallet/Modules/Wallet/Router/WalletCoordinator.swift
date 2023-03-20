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
            let presenter = WalletPresenter()
            let viewController = WalletViewController(presenter: presenter)
//            viewController.router = 
            return .push(viewController)
        case .close:
            return .dismissToRoot()
        }
    }
}
