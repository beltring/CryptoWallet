//
//  TransactionRecord.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 30.03.23.
//

import Foundation
import EvmKit

struct TransactionRecord {
    let transactionHash: String
    let transactionHashData: Data
    let timestamp: Int
    let isFailed: Bool

    let from: Address?
    let to: Address?
    let amount: Decimal?
    let input: String?

    let blockHeight: Int?
    let transactionIndex: Int?

    let decoration: String
}
