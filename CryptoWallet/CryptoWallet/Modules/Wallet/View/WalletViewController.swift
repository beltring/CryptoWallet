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

    // MARK: - Private Properties

    private let adapter: EthereumAdapter = WalletManager.shared.adapter

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
        presenter.view = self
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.backgroundColor = R.color.backgroundColor()
        setupScrollView()
        configureConstraints()
        walletCardView.isHidden = true
        walletCardView.delegate = self
        let words = UserDefaultsService.shared.getWords()

        if !words.isEmpty {
            presenter.loginIfNeeded()
        }

        createWalletCardView.configure(viewModel: .init(title: "Create a free wallet",
                                                  subtitle: "You will need a wallet to buy some\ncryptocurrency and other value.",
                                                  backgroundImage: R.image.walletCardImage()))
        restoreWalletView.delegate = self
        moreThingsView.delegate = self
        createWalletCardView.addTapAction { [weak self] in
            self?.tappedAddAccountCard()
        }
        hideNavBarLine()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainStackView)
        scrollView.isExclusiveTouch = false
        scrollView.delaysContentTouches = false
        mainStackView.addArrangedSubviews([
            ethImageView,
            walletTitleLabel,
            portfolioView,
            createWalletCardView,
            walletCardView,
            restoreWalletView,
            sharkImageView,
            cardImageView,
            moreThingsView,
            descriptionLabel
        ])
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
        }

        mainStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        createWalletCardView.snp.makeConstraints { make in
            make.height.equalTo(210)
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

        ethImageView.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
    }

    // MARK: - Functions

    private func tappedAddAccountCard() {
        presenter.addAccountCardDidPressed()
    }

    // MARK: - UIElements

    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private lazy var ethImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = R.image.ethereumToken()
        return image
    }()

    private lazy var walletTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Wallet"
        label.font = R.font.notoSansSemiBold(size: 24)
        label.textColor = R.color.walletTitleColor()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        // swiftlint:disable line_length
        label.text = "Phasellus proin integer ultrices et euismod auctor scelerisque aliquam. Proin montes, in enim gravida turpis habitasse aliquet tempus. Fames fusce nisl ac neque cras sollicitudin eros. Ornare dignissim penatibus lacinia est."
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 14)
        label.textColor = R.color.portfolioTitleColor()
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
    private lazy var createWalletCardView = CreateWalletCardView()
    private lazy var walletCardView = WalletCardView()
    private lazy var restoreWalletView = RestoreWalletView()
    private lazy var moreThingsView = MoreThingsView()

}
// MARK: WalletViewProtocol

extension WalletViewController: WalletViewProtocol {
    func setupWallet() {
        sync()
    }

    private func sync() {
        let syncStateString: String
        let txSyncStateString: String

        var errorTexts = [String]()

        switch adapter.syncState {
        case .synced:
            syncStateString = "Synced!"
        case .syncing(let progress):
            if let progress = progress {
                syncStateString = "Syncing \(Int(progress * 100)) %"
            } else {
                syncStateString = "Syncing"
            }
        case .notSynced(let error):
            syncStateString = "Not Synced"
            errorTexts.append("Sync Error: \(error)")
        }

        switch adapter.transactionsSyncState {
        case .synced:
            txSyncStateString = "Synced!"
        case .syncing(let progress):
            if let progress = progress {
                txSyncStateString = "Syncing \(Int(progress * 100)) %"
            } else {
                txSyncStateString = "Syncing"
            }
        case .notSynced(let error):
            txSyncStateString = "Not Synced"
            errorTexts.append("Tx Sync Error: \(error)")
        }

        let errorText = errorTexts.joined(separator: "\n\n")

        if errorText.isEmpty {
            createWalletCardView.isHidden = true
            walletCardView.isHidden = false
            walletCardView.configure(viewModel: .init(title: "My main account",
                                                      backgroundImage: R.image.accountCardImage(),
                                                      address: adapter.receiveAddress.hex,
                                                      balance: "\(adapter.balance) \(adapter.coin)"))
            sharkImageView.image = R.image.sharkAccountImage()
            print("/n MYLOG: BALANCE: \(adapter.balance) COIN: \(adapter.coin)")
            print("/n MYLOG: Last Block Height \(adapter.lastBlockHeight.map { "# \($0)" } ?? "n/a")")
            portfolioView.configure(viewModel: .init(value: adapter.balance))
        } else {
            presenter.showErrorAlert(title: "Error", message: errorText)
        }
    }
}

// MARK: - RestoreWalletViewDelegate

extension WalletViewController: RestoreWalletViewDelegate {
    func didTapRestoreButton() {
        presenter.restoreButtonDidPressed()
    }
}

// MARK: - MoreThingsViewDelegate

extension WalletViewController: MoreThingsViewDelegate {
    func didTapChooseThemeButton() {
        print("\n MYLOG: didTapChooseThemeButton")
        UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
    }

    func didTapContactButton() {
        print("\n MYLOG: didTapContactButton")
    }

    func didTapSettingsButton() {
        presenter.settingsButtonDidPressed()
    }
}

// MARK: - WalletCardViewProtocol

extension WalletViewController: WalletCardViewProtocol {
    func tappedRecieveButton() {
        presenter.recieveButtonDidPressed()
    }
}
