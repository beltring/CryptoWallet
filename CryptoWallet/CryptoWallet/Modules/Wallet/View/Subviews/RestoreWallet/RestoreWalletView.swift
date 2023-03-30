//
//  RestoreWalletView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

protocol RestoreWalletViewDelegate: AnyObject {
    func didTapRestoreButton()
}

class RestoreWalletView: UIView {

    // MARK: - Public properties

    weak var delegate: RestoreWalletViewDelegate?

    // MARK: - Private properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have a wallet ?"
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.portfolioTitleColor()
        return label
    }()

    private lazy var restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("RESTORE", for: .normal)
        button.titleLabel?.textColor = R.color.portfolioTitleColor()
        button.titleLabel?.font = R.font.notoSansSemiBold(size: 14)
        return button
    }()

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
        addSubviews([
            titleLabel,
            restoreButton
        ])
        configureConstraints()
        restoreButton.addTarget(self, action: #selector(tappedRestoreButton), for: .touchUpInside)
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }

        restoreButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
    }

    // MARK: - Actions

    @objc private func tappedRestoreButton() {
        delegate?.didTapRestoreButton()
    }
}
