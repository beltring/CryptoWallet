//
//  WalletBackUpCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import UIKit
import XCoordinator

enum WalletBackUpRoute: Route {
    case backUp
    case close
}

class WalletBackUpCoordinator: NavigationCoordinator<WalletBackUpRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .backUp)
    }

    // MARK: Overrides

    override func prepareTransition(for route: WalletBackUpRoute) -> NavigationTransition {
        switch route {
        case .backUp:
            let presenter = WalletBackUpPresenter(router: unownedRouter)
            let viewController = WalletBackUpViewController(presenter: presenter)
            return .push(viewController)
        case .close:
            return .dismissToRoot()
        }
    }
}
