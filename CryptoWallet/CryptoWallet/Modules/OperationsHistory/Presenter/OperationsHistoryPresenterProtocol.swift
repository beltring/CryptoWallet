//
//  OperationsHistoryPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import Foundation

protocol OperationsHistoryPresenterProtocol: AnyObject {
    // MARK: - Properties
    var view: AddAccountViewProtocol? { get set }

    // MARK: - Functions
    func createAccount(name: String)
}
