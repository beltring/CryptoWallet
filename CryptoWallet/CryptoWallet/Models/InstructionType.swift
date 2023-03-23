//
//  InstructionType.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 23.03.23.
//

import UIKit

enum InstructionType: CaseIterable {
    case backUp
    case check
    case warning
}

extension InstructionType {
    var title: String {
        switch self {
        case .backUp:
            return "Back it up, and keep your backup safe"
        case .check:
            return "Always double-check everything"
        case .warning:
            return "Be wary of phishing and scams"
        }
    }

    var description: String {
        switch self {
        case .backUp:
            return "In crypto, you are your own bank. With that great power comes great responsibility."
        case .check:
            return "If you send assets to the wrong address, no one can reverse or recover that transaction, and you will lose your funds."
        case .warning:
            return "If someone offers you something that is too good to be true, it probably is."
        }
    }

    var image: UIImage? {
        switch self {
        case .backUp:
            return R.image.backUpImage()
        case .check:
            return R.image.checkImage()
        case .warning:
            return R.image.warningImage()
        }
    }
}
