//
//  WalletTabBarCoordinator.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator

enum WalletTabBarRoute: Route {
    case initial
    case wallet
    case settings
}

class WalletTabBarCoordinator: TabBarCoordinator<WalletTabBarRoute> {

    // MARK: Stored properties

    private let walletRouter: StrongRouter<WalletRoute>
    private let settingsRouter: StrongRouter<SettingsRoute>
    private let historyRouter: StrongRouter<HistoryRoute>

    // MARK: Initialization

    convenience init() {
        let walletCoordinator = WalletCoordinator()
        walletCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "",
                                                                       image: R.image.walletTab(),
                                                                       selectedImage: R.image.selectedWalletTab())

        let settingCoordinator = SettingsCoordinator()
        settingCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "",
                                                                        image: R.image.settingsTab(),
                                                                        selectedImage: R.image.selectedSettingsTab())

        let historyCoordinator = OperationsHistoryCoordinator()
        historyCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "",
                                                                        image: R.image.historyTab(),
                                                                        selectedImage: R.image.selectedHistoryTab())

        self.init(walletRouter: walletCoordinator.strongRouter,
                  settingsRouter: settingCoordinator.strongRouter,
                  historyRouter: historyCoordinator.strongRouter
        )
    }

    init(walletRouter: StrongRouter<WalletRoute>,
         settingsRouter: StrongRouter<SettingsRoute>,
         historyRouter: StrongRouter<HistoryRoute>) {
        self.walletRouter = walletRouter
        self.settingsRouter = settingsRouter
        self.historyRouter = historyRouter

        super.init(tabs: [walletRouter, historyRouter, settingsRouter], select: walletRouter)
    }

    // MARK: Overrides
    
    override func prepareTransition(for route: WalletTabBarRoute) -> TabBarTransition {
        switch route {
        case .initial:
            return .multiple(
                .set([walletRouter, settingsRouter]),
                .select(walletRouter)
            )
        case .wallet:
            return .select(walletRouter)
        case .settings:
            return .select(settingsRouter)
        }
    }
}
