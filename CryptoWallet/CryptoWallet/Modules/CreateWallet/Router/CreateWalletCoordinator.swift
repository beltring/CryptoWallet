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
    case alert(title: String, message: String)
    case authView
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
        case .alert(let title, let message):
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            rootViewController.modalPresentationStyle = .fullScreen
            return .present(alert)
        case .authView:
            let router = LocalAuthenticationCoordinator()
            router.viewController.modalPresentationStyle = .fullScreen
            return .present(router)
        case .close:
            return .dismiss()
        }
    }
}
