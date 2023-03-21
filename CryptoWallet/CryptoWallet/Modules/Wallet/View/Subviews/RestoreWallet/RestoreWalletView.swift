//
//  RestoreWalletView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

class RestoreWalletView: UIView {

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
        button.titleLabel?.font = R.font.notoSansSemiBold(size: 14)
        return button
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)
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
    }

    private func configureConstraints() {
        
    }
}
