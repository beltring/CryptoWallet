//
//  InstructionView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 22.03.23.
//

import UIKit

class InstructionView: UIView {

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
            imageView,
            titleLabel,
            descriptionLabel
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.height.equalTo(48)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
        }
    }

    // MARK: - Configure

    func configure(viewModel: ViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
    }

    // MARK: - UIElements

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = R.color.createTitleColor()
        label.font = R.font.notoSansSemiBold(size: 20)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = R.color.createDescriptionColor()
        label.font = R.font.notoSansRegular(size: 16)
        return label
    }()
}

// MARK: - ViewModel

extension InstructionView {
    struct ViewModel {
        let image: UIImage?
        let title: String
        let description: String
    }
}
