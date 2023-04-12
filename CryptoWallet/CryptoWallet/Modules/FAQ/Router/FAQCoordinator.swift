//
//  FAQCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import UIKit
import XCoordinator

enum FAQRoute: Route {
    case initial
    case close
}

class FAQCoordinator: NavigationCoordinator<FAQRoute> {

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: FAQRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let presenter = FAQPresenter(router: unownedRouter)
            let viewController = FAQViewController(presenter: presenter)
            viewController.modalPresentationStyle = .fullScreen
            return .push(viewController)
        case .close:
            return .dismiss()
        }
    }
}
