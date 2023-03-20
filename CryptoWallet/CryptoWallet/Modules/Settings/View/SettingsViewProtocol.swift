//
//  SettingsViewProtocol.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import Foundation

protocol SettingsViewProtocol: AnyObject {

    var presenter: SettingsPresenterProtocol { get }
}
