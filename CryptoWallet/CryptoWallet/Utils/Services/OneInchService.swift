//
//  OneInchService.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 29.03.23.
//

import Foundation
import EvmKit
import OneInchKit
import HdWalletKit

class OneInchService {
    static let shared = OneInchService()

    private init() {}

    func generateNewWords() -> String {
        if let generatedWords = try? Mnemonic.generate() {
            return generatedWords.joined(separator: " ")
        }
        return ""
    }

    func createWallet(words: [String]) {
        do {
            try Mnemonic.validate(words: words)

            try Manager.shared.login(words: words)
        }
        catch {
            print("CREATE WALLET")
        }
    }
}
