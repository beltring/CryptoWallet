//
//  SwapCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import UIKit
import XCoordinator

enum SwapRoute: Route {
    case swap
    case close
}

class SwapCoordinator: NavigationCoordinator<SwapRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .swap)
    }

    // MARK: Overrides

    override func prepareTransition(for route: SwapRoute) -> NavigationTransition {
        switch route {
        case .swap:
            let presenter = 
            let viewController = OperationsHistoryViewController(presenter: presenter)
            return .push(viewController)
        case .close:
            return .dismissToRoot()
        }
    }
}

