//
//  CreateWalletCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit
import XCoordinator

enum CreateWalletRoute: Route {
    case createWallet
    case close
}

class CreateWalletCoordinator: NavigationCoordinator<CreateWalletRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .createWallet)
    }

    // MARK: Overrides

    override func prepareTransition(for route: CreateWalletRoute) -> NavigationTransition {
        switch route {
        case .createWallet:
            let presenter = CreateWalletPresenter(router: unownedRouter)
            let viewController = CreateWalletViewController(presenter: presenter)
            viewController.modalPresentationStyle = .pageSheet
            return .push(viewController)
        case .close:
            return .dismiss()
        }
    }
}
