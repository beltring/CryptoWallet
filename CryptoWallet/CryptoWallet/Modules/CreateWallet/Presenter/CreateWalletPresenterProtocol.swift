//
//  CreateWalletPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import Foundation

protocol CreateWalletPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: CreateWalletViewProtocol? { get set }

    // MARK: - Functions
    func closeButtonDidTapped()
    func createWalletButtonDidTapped()
    func presentErrorAlert(error: String)
    func saveCode(code: String)
}
