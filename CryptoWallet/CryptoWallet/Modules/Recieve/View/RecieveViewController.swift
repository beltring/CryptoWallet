//
//  RecieveViewController.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 20.04.23.
//

import UIKit

class RecieveViewController: UIViewController, RecieveViewProtocol {

    // MARK: - Public Properties

    public var presenter: RecievePresenterProtocol

    // MARK: - Init

    required init(presenter: RecievePresenterProtocol) {
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
        title = "Scan QR"
        view.backgroundColor = R.color.createWalletBackgroundColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.arrowBackImage(),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(tappedCloseButton))
        navigationItem.leftBarButtonItem?.tintColor = R.color.createWalletBackColor()

        view.addSubviews([
            qrView,
            qrImageView,
            descriptionLabel
        ])

        configureConstraints()
        generateQRCode()
    }

    private func configureConstraints() {
        let width = UIScreen.main.bounds.width - 32

        qrView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(width)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
        }

        qrImageView.snp.makeConstraints { make in
            make.leading.top.bottom.trailing.equalTo(qrView).inset(60)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(qrView.snp.bottom).offset(32)
        }
    }

    // MARK: - Functions

    private func generateQRCode() {
        let myString = UserDefaultsService.shared.getAddress()
        let data = myString.data(using: String.Encoding.ascii)
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        qrFilter.setValue(data, forKey: "inputMessage")
        guard let qrImage = qrFilter.outputImage else { return }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
        qrImageView.image = UIImage(cgImage: cgImage)
    }

    @objc private func tappedCloseButton() {
        presenter.backButtonDidTapped()
    }

    // MARK: - UIElements

    private lazy var qrImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var qrView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Scan Ethereum address codes to send funds."
        label.font = R.font.notoSansRegular(size: 16)
        label.textColor = R.color.walletTitleColor()
        return label
    }()
}
