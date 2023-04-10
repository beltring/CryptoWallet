//
//  BackUpOnboardingView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import UIKit

class BackUpOnboardingView: UIView {


    private var type = BackUpOnboardingType.backUpNow

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetupUI

    private func setupUI() {
        backgroundColor = R.color.createWalletBackgroundColor()
        addSubviews([
            titleLabel,
            descriptionLabel,
            button
        ])
        configureConstraints()
        configure()
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        button.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func configure() {
        titleLabel.text = type.title
        descriptionLabel.text = type.description
        button.setTitle(type.buttonTitle, for: .normal)
    }

    // MARK: - Functions

    @objc private func tappedButton() {
        type = .start
        configure()
    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.notoSansSemiBold(size: 28)
        label.textColor = R.color.walletTitleColor()
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.notoSansRegular(size: 16)
        label.numberOfLines = 0
        label.textColor = R.color.portfolioTitleColor()
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = R.color.endButtonColor()
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
}
