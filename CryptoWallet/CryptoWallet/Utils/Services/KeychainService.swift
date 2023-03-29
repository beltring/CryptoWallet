//
//  KeychainService.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 29.03.23.
//

import Foundation
import KeychainSwift

class KeychainService {

    static let shared = KeychainService()

    private let keychain = KeychainSwift()

    private init() {}

    func savePasscode(code: String) {
        keychain.set(code, forKey: KeychainKeys.passcode)
    }

    func deletePasscode() {
        keychain.delete(KeychainKeys.passcode)
    }

    func saveBiometricType(type: BiometricType) {
        keychain.set(type.rawValue, forKey: KeychainKeys.biometricType)
    }

    func deleteBiometricType() {
        keychain.delete(KeychainKeys.biometricType)
    }

    func saveAccount(name: String) {
        keychain.set(name, forKey: KeychainKeys.accountName)
    }

    func deleteAccount() {
        keychain.delete(KeychainKeys.accountName)
    }
}
