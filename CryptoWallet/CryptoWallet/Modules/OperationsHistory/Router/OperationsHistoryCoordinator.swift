//
//  OperationsHistoryCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import UIKit
import XCoordinator

enum HistoryRoute: Route {
    case history
    case close
}

class OperationsHistoryCoordinator: NavigationCoordinator<HistoryRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .history)
    }

    // MARK: Overrides

    override func prepareTransition(for route: HistoryRoute) -> NavigationTransition {
        switch route {
        case .history:
            let presenter = OperationsHistoryPresenter(router: unownedRouter)
            let viewController = OperationsHistoryViewController(presenter: presenter)
            return .push(viewController)
        case .close:
            return .dismissToRoot()
        }
    }
}
