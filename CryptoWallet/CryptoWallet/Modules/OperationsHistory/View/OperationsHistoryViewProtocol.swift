//
//  OperationsHistoryViewProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import Foundation

protocol OperationsHistoryViewProtocol: AnyObject {
    var presenter: OperationsHistoryPresenterProtocol { get }
}
