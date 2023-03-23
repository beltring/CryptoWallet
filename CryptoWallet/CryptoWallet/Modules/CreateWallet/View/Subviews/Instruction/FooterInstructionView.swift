//
//  FooterInstructionView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import UIKit

class FooterInstructionView: UIView {

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

    // MARK: - UIElements

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.createDescriptionColor()
        label.font = R.font.notoSansRegular(size: 16)
        label.numberOfLines = 0
        label.text = "In crypto, you are your own bank. With that great power comes great responsibility."
        return label
    }()
}
