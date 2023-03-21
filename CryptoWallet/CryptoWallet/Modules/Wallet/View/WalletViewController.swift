//
//  WalletViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 17.03.23.
//

import UIKit
import SnapKit

class WalletViewController: UIViewController {

    // MARK: - Public Properties

    public var presenter: WalletPresenterProtocol

    // MARK: - Init

    required init(presenter: WalletPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.backgroundColor = R.color.backgroundColor()
        setupScrollView()
        configureConstraints()

        walletCardView.configure(viewModel: .init(title: "Create a free wallet",
                                                  subtitle: "You will need a wallet to buy some\ncryptocurrency and other value.",
                                                  backgroundImage: R.image.walletCardImage()))
        restoreWalletView.delegate = self
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubviews([
            walletTitleLabel,
            portfolioView,
            walletCardView,
            restoreWalletView,
            sharkImageView,
            cardImageView
        ])
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }

        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }

        walletCardView.snp.makeConstraints { make in
            make.height.equalTo(210)
        }

        sharkImageView.snp.makeConstraints { make in
            make.height.equalTo(175)
        }

        cardImageView.snp.makeConstraints { make in
            make.height.equalTo(210)
        }
    }

    // MARK: - UIElements

    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var walletTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Wallet"
        label.font = R.font.notoSansSemiBold(size: 24)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var sharkImageView: UIImageView = {
        let sharkImageView = UIImageView()
        sharkImageView.image = R.image.sharkCreateImage()
        sharkImageView.contentMode = .scaleAspectFit
        return sharkImageView
    }()

    private lazy var cardImageView: UIImageView = {
        let sharkImageView = UIImageView()
        sharkImageView.image = R.image.cardImage()
        sharkImageView.contentMode = .scaleAspectFit
        return sharkImageView
    }()

    private lazy var portfolioView = PortfolioValueView()
    private lazy var walletCardView = WalletCardView()
    private lazy var restoreWalletView = RestoreWalletView()

}
// MARK: WalletViewProtocol

extension WalletViewController: WalletViewProtocol {

}

// MARK: - RestoreWalletViewDelegate

extension WalletViewController: RestoreWalletViewDelegate {
    func didTapRestoreButton() {
        print("/n MY LOG: didTapRestoreButton")
    }
}
