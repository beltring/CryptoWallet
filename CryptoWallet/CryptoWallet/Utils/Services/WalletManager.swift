//
//  WalletManager.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 30.03.23.
//

import Foundation
import RxSwift
import EvmKit
import HdWalletKit

class WalletManager {

    static let shared = WalletManager()

    var evmKit: Kit!
    var signer: Signer!
    var adapter: EthereumAdapter!

    private let ud = UserDefaultsService.shared

    init() {
        if let words = savedWords {
            try? initKit(words: words)
        } else if let address = savedAddress {
            try? initKit(address: address)
        }
    }

    private func initKit(address: Address, configuration: Configuration, signer: Signer?) throws {
        let evmKit = try Kit.instance(
                address: address,
                chain: configuration.chain,
                rpcSource: configuration.rpcSource,
                transactionSource: configuration.transactionSource,
                walletId: "walletId",
                minLogLevel: configuration.minLogLevel
        )

        adapter = EthereumAdapter(evmKit: evmKit, signer: signer)

        self.evmKit = evmKit
        self.signer = signer

        evmKit.start()
    }

    private func initKit(words: [String]) throws {
        let configuration = Configuration.shared

        guard let seed = Mnemonic.seed(mnemonic: words) else {
            throw LoginError.seedGenerationFailed
        }

        let signer = try Signer.instance(seed: seed, chain: configuration.chain)

        try initKit(
                address: try Signer.address(seed: seed, chain: configuration.chain),
                configuration: configuration,
                signer: signer
        )
    }

    private func initKit(address: Address) throws {
        let configuration = Configuration.shared

        try initKit(address: address, configuration: configuration, signer: nil)
    }

    private var savedWords: [String]? {
        let wordsString = ud.getWords()

        guard !wordsString.isEmpty else {
            return nil
        }

        return wordsString.split(separator: " ").map(String.init)
    }

    private var savedAddress: Address? {
        let addressString = ud.getAddress()

        guard !addressString.isEmpty else {
            return nil
        }

        return try? Address(hex: addressString)
    }

    private func clearStorage() {
        ud.clearStorage()
    }

}

extension WalletManager {

    func login(words: [String]) throws {
        try Kit.clear(exceptFor: ["walletId"])

        try initKit(words: words)
    }

    func watch(address: Address) throws {
        try Kit.clear(exceptFor: ["walletId"])

        ud.setAddress(address: address.hex)
        try initKit(address: address)
    }

    func logout() {
        clearStorage()

        signer = nil
        evmKit = nil
        adapter = nil
    }

}

extension WalletManager {

    enum LoginError: Error {
        case seedGenerationFailed
    }

}
