//
//  WalletPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import Foundation

protocol WalletPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: WalletViewProtocol? { get set }

    func addAccountCardDidPressed()

    func settingsButtonDidPressed()

    func restoreButtonDidPressed()

    func recieveButtonDidPressed()

    func loginIfNeeded()

    func getWords() -> String

    func showErrorAlert(title: String, message: String)
}
