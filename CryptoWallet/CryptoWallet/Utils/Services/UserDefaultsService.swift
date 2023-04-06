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
}
