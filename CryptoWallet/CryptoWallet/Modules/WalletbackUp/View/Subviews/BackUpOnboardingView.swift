//
//  BackUpOnboardingView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 5.04.23.
//

import UIKit

class BackUpOnboardingView: UIView {

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

    private func configureConstraints() {

    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.notoSansSemiBold(size: 28)
//        label.textColor = R.color.
        return label
    }()
}
