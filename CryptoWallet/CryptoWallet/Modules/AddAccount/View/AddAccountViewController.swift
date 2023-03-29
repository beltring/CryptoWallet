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
        title = "Add Account"
        view.backgroundColor = R.color.createWalletBackgroundColor()

        view.addSubviews([
            accountNicknameLabel,
            accountNicknameTextField
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        accountNicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        accountNicknameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(accountNicknameLabel.snp.bottom).offset(8)
            make.height.equalTo(50)
        }
    }

    // MARK: - Functions

    @objc private func tappedAddButton() {
        guard let name = accountNicknameLabel.text else { return }
        presenter.createAccount(name: name)
    }

    // MARK: - UIElements

    private lazy var accountNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Account nickname"
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var accountNicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Invent a nickname for your account"
        textField.backgroundColor = R.color.backgroundColor()
        textField.layer.cornerRadius = 10
        return textField
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = R.color.endButtonColor()
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
}

extension AddAccountViewController: AddAccountViewProtocol {

}
