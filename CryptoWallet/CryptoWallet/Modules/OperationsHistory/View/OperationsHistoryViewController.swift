//
//  OperationsHistoryViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 3.04.23.
//

import UIKit

class OperationsHistoryViewController: UIViewController, OperationsHistoryViewProtocol {

    // MARK: - Public Properties
    public var presenter: OperationsHistoryPresenterProtocol

    // MARK: - Init

    required init(presenter: OperationsHistoryPresenterProtocol) {
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
        title = "Settings"
        tabBarController?.tabBar.selectedItem?.title = ""
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
        view.addSubviews([
            sharkHistoryImage,
            titleLabel,
            descriptionLabel,
            buyCryptoButton
        ])

        setupConstraints()
    }

    private func setupConstraints() {
        sharkHistoryImage.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(150)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(sharkHistoryImage.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        buyCryptoButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }

    // MARK: - Functions

    @objc private func tappedBuyCryptoButton() {
        print("\n MYLOG: tappedBuyCryptoButton")
    }

    // MARK: - UIElements

    private lazy var sharkHistoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = R.image.noOperationShark()
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "No operations history"
        label.font = R.font.notoSansSemiBold(size: 24)
        label.textColor = R.color.createTitleColor()
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "History will appear automatically after any operation: buy, send, exchange, and others."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.portfolioTitleColor()
        return label
    }()

    private lazy var buyCryptoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy crypto", for: .normal)
        button.backgroundColor = R.color.startButtonColor()
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = R.font.notoSansRegular(size: 16)
        button.addTarget(self, action: #selector(tappedBuyCryptoButton), for: .touchUpInside)
        return button
    }()
}
