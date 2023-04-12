//
//  FAQPresenterProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import Foundation

protocol FAQPresenterProtocol: AnyObject {

    // MARK: - Properties
    var view: FAQViewProtocol? { get set }

    // MARK: - Functions
    func backButtonDidTapped()
    func getFAQCount() -> Int
    func getFAQ(index: Int) -> FAQ
}
