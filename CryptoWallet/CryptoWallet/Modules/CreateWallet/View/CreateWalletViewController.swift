//
//  CreateWalletViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit

class CreateWalletViewController: UIViewController {

    // MARK: - Public Properties

    public var presenter: CreateWalletPresenterProtocol

    private let biometricType = LocalAuthenticationService.shared.biometricType()

    // MARK: - Init

    required init(presenter: CreateWalletPresenterProtocol) {
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
        presenter.view = self
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubviews([
            createWalletInstructionView,
            pinView,
            localAuthView
        ])
        pinView.isHidden = true
        localAuthView.isHidden = true
        createWalletInstructionView.delegate = self
        pinView.delegate = self
        localAuthView.delegate = self
        localAuthView.configure(biometricType: biometricType)
        view.backgroundColor = R.color.createWalletBackgroundColor()
        configureConstraints()
        hideNavBarLine()
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }

        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }

    // MARK: - Functions

    @objc private func tappedBackButton() {
        presenter.closeButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var createWalletInstructionView = CreateWalletInstructionView()
    private lazy var pinView = CreatePinView()
    private lazy var localAuthView = LocalAuthenticationView()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
}

// MARK: - CreateWalletViewProtocol

extension CreateWalletViewController: CreateWalletViewProtocol {
    func showCreatePinView() {
        createWalletInstructionView.isHidden = true
        pinView.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Create a wallet"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedBackButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()
        pinView.showKeyboardIfNeeded()
    }

    func showFaceIdView() {
        print("\n MYLOG: showFaceIdView")
    }
}

// MARK: - CreateWalletInstructionDelegate

extension CreateWalletViewController: CreateWalletInstructionDelegate {
    func didTappedCreateWalletButton() {
        presenter.createWalletButtonDidTapped()
    }

    func didTappedCloseButton() {
        presenter.closeButtonDidTapped()
    }
}

// MARK: - CreatePinViewDelegate

extension CreateWalletViewController: CreatePinViewDelegate {
    func didEnterPasscode(code: String) {
        localAuthView.isHidden = false
//        presenter.getkey()
        pinView.isHidden = true
    }
}

// MARK: - LocalAuthenticationViewDelegate

extension CreateWalletViewController: LocalAuthenticationViewDelegate {
    func didTappedApprove() {
        presenter.closeButtonDidTapped()
    }

    func didObtainError(error: String) {
        presenter.presentErrorAlert(error: error)
    }
}
