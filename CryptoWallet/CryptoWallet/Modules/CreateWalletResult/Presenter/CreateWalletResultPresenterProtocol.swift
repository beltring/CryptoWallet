//
//  CreateWalletResultPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import Foundation

protocol CreateWalletResultPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: CreateWalletViewProtocol? { get set }

    // MARK: - Functions
    func doneButtonDidTapped()
}
