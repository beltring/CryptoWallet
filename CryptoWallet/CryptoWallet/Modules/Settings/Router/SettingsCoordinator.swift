//
//  SettingsCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator

enum SettingsRoute: Route {
    case settings
    case privacyPolicy
    case close
}

class SettingsCoordinator: NavigationCoordinator<SettingsRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .settings)
    }

    // MARK: Overrides

    override func prepareTransition(for route: SettingsRoute) -> NavigationTransition {
        switch route {
        case .settings:
            let presenter = SettingsPresenter(router: unownedRouter)
            let viewController = SettingsViewController(presenter: presenter)
            return .push(viewController)
        case .privacyPolicy:
            let router = PrivacyPolicyCoordinator()
            return .present(router)
        case .close:
            return .dismissToRoot()
        }
    }
}
