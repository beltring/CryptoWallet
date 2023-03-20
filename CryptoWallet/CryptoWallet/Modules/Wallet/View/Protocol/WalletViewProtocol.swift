//
//  WalletViewProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import Foundation

protocol WalletViewProtocol: AnyObject {

    var presenter: WalletPresenterProtocol { get }
}
