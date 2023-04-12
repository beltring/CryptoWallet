//
//  FAQTitleView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import UIKit

class FAQTitleView: UIView {

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
            arrowImageView
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }

        arrowImageView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.width.height.equalTo(24)
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
        }
    }

    func configure(title: String) {
        titleLabel.text = title
    }

    func configure(isExpanded: Bool) {
        arrowImageView.image = isExpanded ? R.image.faqDownArrow() : R.image.faqUpArrow() 
    }

    // MARK: - UIElements

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 18)
        label.textColor = R.color.faqTitleColor()
        return label
    }()

    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.faqDownArrow()
        return imageView
    }()
}
