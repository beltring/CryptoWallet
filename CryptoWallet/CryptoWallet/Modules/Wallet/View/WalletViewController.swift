//
//  WalletViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit

class WalletViewController: UIViewController {

    // MARK: - Public Properties

    public var presenter: WalletPresenterProtocol

    // MARK: - Init

    required init(presenter: WalletPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

// MARK: WalletViewProtocol

extension WalletViewController: WalletViewProtocol {

}
