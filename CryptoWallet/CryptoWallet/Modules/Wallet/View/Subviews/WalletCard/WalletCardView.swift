//
//  WalletCardView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 21.03.23.
//

import UIKit

class WalletCardView: UIView {

    // MARK: - Private Properties

    private var viewModel: ViewModel?

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel?.title
        label.font = R.font.notoSansBold(size: 24)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = viewModel?.subtitle
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.walletTitleColor()
        return label
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
            backgroundImage,
            titleLabel,
            descriptionLabel
        ])

        configureConstraints()
    }

    private func configureConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }

    func configure(viewModel: ViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.subtitle
        backgroundImage.image = viewModel.backgroundImage
    }
}

// MARK: - ViewModels

extension WalletCardView {
    struct ViewModel {
        let title: String
        let subtitle: String
        let backgroundImage: UIImage?
    }
}
