//
//  WalletBackUpViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import UIKit

class WalletBackUpViewController: UIViewController, WalletBackUpViewProtocol {

    // MARK: - Public Properties
    public var presenter: WalletBackUpPresenterProtocol

    // MARK: - Init

    required init(presenter: WalletBackUpPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.selectedItem?.title = ""
    }
}
