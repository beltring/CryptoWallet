//
//  WalletBackUpPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import Foundation

protocol WalletBackUpPresenterProtocol: AnyObject {
    // MARK: - Properties
    var view: WalletBackUpViewProtocol? { get set }

    // MARK: - Functions

    func backUpNowButtonDidTapped()

    func closeButtonDidTapped()
}
