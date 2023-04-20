//
//  LocalAuthenticationViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit

class LocalAuthenticationViewController: UIViewController {

    // MARK: - Public Properties

    public var presenter: LocalAuthenticationPresenterProtocol

    private let localAuthView = LocalAuthenticationView()
    private let biometricType = LocalAuthenticationService.shared.biometricType()

    // MARK: - Init

    required init(presenter: LocalAuthenticationPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        localAuthView.delegate = self
        setupUI()
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
        view.backgroundColor = R.color.createWalletBackgroundColor()
        view.addSubview(localAuthView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()
        configureConstraint()
        localAuthView.configure(biometricType: biometricType)
    }

    private func configureConstraint() {
        localAuthView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Functions

    @objc private func tappedCloseButton() {
        presenter.closeButtonDidTapped()
    }
}

// MARK: - LocalAuthenticationViewDelegate

extension LocalAuthenticationViewController: LocalAuthenticationViewDelegate {
    func enableButtonDidTapped() {
        presenter.createWalletButtonDidTapped()
    }

    func didObtainError(error: String) {
        presenter.presentErrorAlert(error: error)
    }
}
