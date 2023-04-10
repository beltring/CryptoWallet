//
//  SeedPhraseView.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 7.04.23.
//

import UIKit

class SeedPhraseView: UIView {

    var wordsCollectionView: UICollectionView!

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
        setupCollection()
        addSubview(wordsCollectionView)
        configureConstraints()
    }

    private func configureConstraints() {
        wordsCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)

        wordsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        wordsCollectionView.register(WordCell.self, forCellWithReuseIdentifier: WordCell.cellIdentifier)
        wordsCollectionView.backgroundColor = UIColor.white
        wordsCollectionView.delegate = self
        wordsCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource&UICollectionViewDelegate

extension SeedPhraseView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WordCell.cellIdentifier,
                                                            for: indexPath) as? WordCell
        else {
            return UICollectionViewCell()
        }
        cell.configure(number: 1, title: "TestTT")
        return cell
    }
}
