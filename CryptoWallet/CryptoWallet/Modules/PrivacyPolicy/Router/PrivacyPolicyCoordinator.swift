//
//  PrivacyPolicyCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import UIKit
import XCoordinator

enum PrivacyPolicyRoute: Route {
    case initial
    case close
}

class PrivacyPolicyCoordinator: NavigationCoordinator<PrivacyPolicyRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: PrivacyPolicyRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = PrivacyPolicyPresenter(router: unownedRouter)
            let viewController = PrivacyPolicyViewController(presenter: presenter)
            viewController.modalPresentationStyle = .fullScreen
            return .push(viewController)
        case .close:
            return .dismiss()
        }
    }
}
