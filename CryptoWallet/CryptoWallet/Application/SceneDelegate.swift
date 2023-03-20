//
//  SceneDelegate.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import XCoordinator

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: Stored properties

    private lazy var mainWindow = UIWindow()
    private var router: StrongRouter<AppRoute>!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        router = AppCoordinator().strongRouter
        mainWindow.windowScene = scene as? UIWindowScene
        router.setRoot(for: mainWindow)
    }
}
