//
//  RecieveCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 20.04.23.
//

import UIKit
import XCoordinator

enum RecieveRoute: Route {
    case initial
    case close
}

class RecieveCoordinator: NavigationCoordinator<RecieveRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: RecieveRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = RecievePresenter(router: unownedRouter)
            let viewController = RecieveViewController(presenter: presenter)
            viewController.modalPresentationStyle = .fullScreen
            return .push(viewController)
        case .close:
            return .dismiss()
        }
    }
}
