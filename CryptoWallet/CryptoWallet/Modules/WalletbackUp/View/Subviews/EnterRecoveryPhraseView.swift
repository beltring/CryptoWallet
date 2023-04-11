//
//  EnterRecoveryPhraseView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 11.04.23.
//

import UIKit

class EnterRecoveryPhraseView: UIView {

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
    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Here is your recovery phrase"
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.createWalletBackColor()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Write it down on paper. Resist the temptation to email it to yourself or screenshot it."
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.portfolioTitleColor()
        return label
    }()
}
