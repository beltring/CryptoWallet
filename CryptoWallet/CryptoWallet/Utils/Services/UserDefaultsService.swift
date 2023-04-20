//
//  UserDefaultsService.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService()

    private let ud = UserDefaults.standard

    private init() {}

    func setWords(words: String) {
        ud.set(words, forKey: UserDefaultsKeys.words)
    }

    func getWords() -> String {
        return ud.string(forKey: UserDefaultsKeys.words) ?? ""
    }

    func setAddress(address: String) {
        ud.set(address, forKey: UserDefaultsKeys.address)
    }

    func getAddress() -> String {
        return ud.string(forKey: UserDefaultsKeys.address) ?? ""
    }

    func clearStorage() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.words)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.address)
        UserDefaults.standard.synchronize()
    }
}
