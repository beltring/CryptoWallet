//
//  AddAccountViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import UIKit

class AddAccountViewController: UIViewController {

    // MARK: - Public Properties
    public var presenter: AddAccountPresenterProtocol

    // MARK: - Init
    required init(presenter: AddAccountPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.backgroundColor = .green
    }
}
