//
//  PrivacyPolicyPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import Foundation

protocol PrivacyPolicyPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: PrivacyPolicyViewProtocol? { get set }

    // MARK: - Functions
    func backButtonDidTapped()
}
