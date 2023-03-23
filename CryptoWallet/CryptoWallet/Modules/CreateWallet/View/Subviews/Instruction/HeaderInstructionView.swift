//
//  HeaderInstructionView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import UIKit

class HeaderInstructionView: UIView {

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
            descriptionLabel
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.createTitleColor()
        label.numberOfLines = 0
        label.font = R.font.notoSansSemiBold(size: 20)
        label.text = "Crypto safety 101"
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.createDescriptionColor()
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 16)
        label.text = "In crypto, you are your own bank. With that great power comes great responsibility."
        return label
    }()
}
