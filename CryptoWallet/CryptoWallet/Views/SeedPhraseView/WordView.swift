//
//  WordView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit

class WordView: UIView {

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
            numberLabel,
            wordLabel
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        numberLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(20)
        }

        wordLabel.snp.makeConstraints { make in
            make.leading.equalTo(numberLabel.snp.trailing).offset(5)
            make.trailing.top.bottom.equalToSuperview()
        }
    }

    // MARK: - UIElements

    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.numberWordColor()
        label.font = R.font.notoSansMedium(size: 14)
        return label
    }()

    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.walletTitleColor()
        label.textAlignment = .left
        return label
    }()

    // MARK: - Configure

    func configure(viewModel: ViewModel) {
        numberLabel.text = "\(viewModel.number)"
        wordLabel.text = viewModel.word
    }
}

extension WordView {
    struct ViewModel {
        let number: Int
        let word: String
    }
}
