//
//  AddAccountCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import UIKit
import XCoordinator

enum AddAccountRoute: Route {
    case addAccount
    case close
}

class AddAccountCoordinator: NavigationCoordinator<AddAccountRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .addAccount)
    }

    // MARK: Overrides

    override func prepareTransition(for route: AddAccountRoute) -> NavigationTransition {
        switch route {
        case .addAccount:
            let presenter = AddAccountPresenter()
            let viewController = AddAccountViewController(presenter: presenter)
            viewController.modalPresentationStyle = .pageSheet
            return .push(viewController)
        case .close:
            return .dismissToRoot()
        }
    }
}
