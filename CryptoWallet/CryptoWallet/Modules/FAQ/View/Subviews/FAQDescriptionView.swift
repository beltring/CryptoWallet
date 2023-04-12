//
//  FAQDescriptionView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import UIKit

class FAQDescriptionView: UIView {

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
            descriptionLabel
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        descriptionLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(description: String) {
        descriptionLabel.text = description
    }

    // MARK: - UIElements

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.walletTitleColor()
        return label
    }()
}
