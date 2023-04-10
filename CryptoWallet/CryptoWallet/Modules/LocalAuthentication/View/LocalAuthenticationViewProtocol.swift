//
//  LocalAuthenticationViewProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import Foundation

protocol LocalAuthenticationViewProtocol: AnyObject {
    func showCreatePinView()
    func showFaceIdView()
}
