//
//  RecievePresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 20.04.23.
//

import Foundation

protocol RecievePresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: FAQViewProtocol? { get set }

    // MARK: - Functions
    func backButtonDidTapped()
}
