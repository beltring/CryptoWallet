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
        setupUI()
        tabBarController?.tabBar.selectedItem?.title = ""

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.addSubview(backUpOnboardingView)
        configureConstraints()
    }

    private func configureConstraints() {
        backUpOnboardingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Functions

    @objc private func tappedCloseButton() {
        presenter.closeButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var backUpOnboardingView = BackUpOnboardingView()
}
