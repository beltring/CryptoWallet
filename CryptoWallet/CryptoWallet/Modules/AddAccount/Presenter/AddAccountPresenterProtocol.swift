//
//  AddAccountPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import Foundation

protocol AddAccountPresenterProtocol: AnyObject {
    // MARK: - Properties
    var view: AddAccountViewProtocol? { get set }

    // MARK: - Functions
    func createAccount(name: String)
}
