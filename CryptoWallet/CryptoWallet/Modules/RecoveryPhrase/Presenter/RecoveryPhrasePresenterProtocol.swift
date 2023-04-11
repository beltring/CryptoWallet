//
//  RecoveryPhrasePresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 10.04.23.
//

import Foundation

protocol RecoveryPhrasePresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: RecoveryPhraseViewProtocol? { get set }

    // MARK: - Functions
    func backButtonDidTapped()
    func nextButtonDidTapped()
    func presentErrorAlert(error: String)
    func presentAlert(message: String)
}
