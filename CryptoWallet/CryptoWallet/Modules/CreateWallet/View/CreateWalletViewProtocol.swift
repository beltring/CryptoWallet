//
//  CreateWalletViewProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import Foundation

protocol CreateWalletViewProtocol: AnyObject {
    func showCreatePinView()
    func showFaceIdView()
}
