//
//  WordCell.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 10.04.23.
//

import UIKit

class WordCell: UICollectionViewCell {

    static let cellIdentifier = "wordCellIdentifier"

    private lazy var wordView = WordView()

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - SetupUI

    private func setupUI() {
        addSubview(wordView)
    }

    private func configureConstraints() {
        wordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(number: Int, title: String) {
        wordView.configure(viewModel: .init(number: number, word: title))
    }
}
