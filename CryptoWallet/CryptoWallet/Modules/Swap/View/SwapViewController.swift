//
//  SwapViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import UIKit

class SwapViewController: UIViewController, SwapViewProtocol {

    // MARK: - Public Properties
    public var presenter: SwapPresenterProtocol

    // MARK: - Init

    required init(presenter: SwapPresenterProtocol) {
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
        tabBarController?.tabBar.selectedItem?.title = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - SetupUI

    private func setupUI() {

    }

    private func configureConstraint() {

    }
}
