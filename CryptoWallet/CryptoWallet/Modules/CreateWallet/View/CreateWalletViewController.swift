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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(createWalletInstructionView)
        createWalletInstructionView.delegate = self
        view.backgroundColor = R.color.createWalletBackgroundColor()
        configureConstraints()
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

    // MARK: - UIElements

    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var createWalletInstructionView = CreateWalletInstructionView()
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
