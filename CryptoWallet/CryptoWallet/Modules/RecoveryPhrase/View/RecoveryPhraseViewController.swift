//
//  RecoveryPhraseViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 10.04.23.
//

import UIKit

class RecoveryPhraseViewController: UIViewController, RecoveryPhraseViewProtocol {

    // MARK: - Public Properties

    public var presenter: RecoveryPhrasePresenterProtocol

    // MARK: - Init

    required init(presenter: RecoveryPhrasePresenterProtocol) {
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
        setupNavBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.presentAlert(message: "Write down the words on a piece of paper or click to copy")
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.backgroundColor = R.color.createWalletBackgroundColor()
        view.addSubviews([
            titleLabel,
            descriptionLabel,
            phraseView
        ])
        configureConstraints()

        phraseView.addTapAction {
            UIPasteboard.general.string = UserDefaultsService.shared.getWords()
        }
    }

    private func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedBackButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(tappedNextButton))
        navigationItem.rightBarButtonItem?.tintColor = R.color.createWalletBackColor()
    }

    private func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        phraseView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }

    // MARK: - Functions

    @objc private func tappedBackButton() {
        presenter.backButtonDidTapped()
    }

    @objc private func tappedNextButton() {
        presenter.nextButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var phraseView = SeedPhraseView()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Here is your recovery phrase"
        label.numberOfLines = 0
        label.font = R.font.notoSansSemiBold(size: 28)
        label.textColor = R.color.createWalletBackColor()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Write it down on paper. Resist the temptation to email it to yourself or screenshot it."
        label.numberOfLines = 0
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.portfolioTitleColor()
        return label
    }()
}
