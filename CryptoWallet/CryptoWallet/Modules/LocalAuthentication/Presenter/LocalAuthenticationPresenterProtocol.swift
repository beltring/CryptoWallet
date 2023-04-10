//
//  LocalAuthenticationPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import Foundation

protocol LocalAuthenticationPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: CreateWalletViewProtocol? { get set }

    // MARK: - Functions
    func closeButtonDidTapped()
    func createWalletButtonDidTapped()
    func presentErrorAlert(error: String)
}
