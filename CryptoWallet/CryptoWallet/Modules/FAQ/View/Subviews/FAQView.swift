//
//  FAQView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import UIKit

class FAQView: UIView {

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
        addSubview(faqStackView)
        faqStackView.addArrangedSubviews([
            titleView,
            descriptionView
        ])
        configureConstraints()
    }

    private func configureConstraints() {
        faqStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(title: String, description: String) {
        titleView.configure(title: title)
        descriptionView.configure(description: description)
        descriptionView.isHidden = true
    }

    func configure(isExpanded: Bool) {
        titleView.configure(isExpanded: isExpanded)
        descriptionView.isHidden = isExpanded
    }

    func getIsHiddenView() -> Bool {
        return descriptionView.isHidden
    }

    // MARK: - UIElements

    private lazy var titleView = FAQTitleView()
    private lazy var descriptionView = FAQDescriptionView()

    private lazy var faqStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
}
