//
//  SwapPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import Foundation

protocol SwapPresenterProtocol: AnyObject {
    // MARK: - Properties
    var view: SwapViewProtocol? { get set }

    // MARK: - Functions
//    func createAccount(name: String)
}
