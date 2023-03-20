//
//  SettingsViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Public Properties
    public var presenter: SettingsPresenterProtocol

    // MARK: - Init
    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsViewController: SettingsViewProtocol {

}
