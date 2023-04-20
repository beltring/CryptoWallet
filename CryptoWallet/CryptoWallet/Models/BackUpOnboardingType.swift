//
//  BackUpOnboardingType.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 6.04.23.
//

import UIKit

enum BackUpOnboardingType {
    case backUpNow
    case start

    var title: String {
        switch self {
        case .backUpNow:
            return "Back up your wallet"
        case .start:
            return "Prepare to write down your recovery phrase"
        }
    }

    var description: String {
        switch self {
        case .backUpNow:
            return """
            Ac, libero viverra nec nunc, non sit. Arcu integer risus pellentesque scelerisque lacus, felis egestas mattis cursus.
            Quam eget a cras ac. Viverra diam tortor, faucibus cursus tortor. Nunc tincidunt semper semper adipiscing donec scelerisque.
            """
        case .start:
            return "If you device gets lost or stolen, you can restore your wallet using your recovery phrase. Get pen and paper before you start."
        }
    }

    var buttonTitle: String {
        switch self {
        case .backUpNow:
            return "Back up now"
        case .start:
            return "Start"
        }
    }

    var image: UIImage? {
        switch self {
        case .backUpNow:
            return R.image.onboardingBackUpFirstImage()
        case .start:
            return R.image.onboardingBackUpSecondImage()
        }
    }
}
