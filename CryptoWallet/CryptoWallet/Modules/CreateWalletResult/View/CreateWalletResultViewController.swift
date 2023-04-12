//
//  CreateWalletResultViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import Foundation
import XCoordinator

class CreateWalletResultViewController: UIViewController, CreateWalletResultViewProtocol {

    // MARK: - Public Properties

    public var presenter: CreateWalletResultPresenterProtocol

    // MARK: - Init

    required init(presenter: CreateWalletResultPresenterProtocol) {
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

    private func setupUI() {
        view.backgroundColor = R.color.createWalletBackgroundColor()
        successView.delegate = self
        view.addSubview(successView)
        configureConstraints()
    }

    private func configureConstraints() {
        successView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - UIElements

    private lazy var successView = CreateWalletSuccessView()
}

extension CreateWalletResultViewController: CreateWalletSuccessViewDelegate {
    func doneButtonDidTapped() {
        presenter.doneButtonDidTapped()
    }
}
