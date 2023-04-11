//
//  SeedPhraseView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit

class SeedPhraseView: UIView {

    private var wordsCollectionView: UICollectionView!

    private let words = UserDefaultsService.shared.getWords().components(separatedBy: " ")

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
        backgroundColor = R.color.createWalletBackgroundColor()
        setupCollection()
        addSubview(wordsCollectionView)
        configureConstraints()
        wordsCollectionView.reloadData()
    }

    private func configureConstraints() {
        wordsCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        wordsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        wordsCollectionView.backgroundColor = R.color.createWalletBackgroundColor()
        wordsCollectionView.register(WordCell.self, forCellWithReuseIdentifier: WordCell.cellIdentifier)
        wordsCollectionView.delegate = self
        wordsCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource&UICollectionViewDelegate

extension SeedPhraseView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCell.cellIdentifier,
                                                            for: indexPath) as? WordCell
        else {
            return UICollectionViewCell()
        }
        let word = words[indexPath.row]
        cell.configure(number: indexPath.row + 1, title: word)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SeedPhraseView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCollection = UIScreen.main.bounds.width - 32
        let widthCell = (widthCollection - 32) / 2
        let heightCell: CGFloat = 30

        return .init(width: widthCell, height: heightCell)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
