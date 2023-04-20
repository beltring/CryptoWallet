//
//  PortfolioValueView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

class PortfolioValueView: UIView {

    // MARK: Private Properties

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total portfolio value"
        label.textColor = R.color.portfolioTitleColor()
        label.font = R.font.notoSansSemiBold(size: 19)
        return label
    }()

    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0345341212"
        label.textColor = R.color.walletTitleColor()
        label.font = R.font.notoSansBold(size: 24)
        return label
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
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
        addSubview(mainStackView)
        mainStackView.addArrangedSubviews([
            titleLabel,
            balanceLabel
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Configure

    func configure(viewModel: PortfolioValueViewModel) {
        balanceLabel.text = "\(viewModel.value)"
    }
}

// MARK: - ViewModel

extension PortfolioValueView {
    struct PortfolioValueViewModel {
        let value: Decimal
    }
}
