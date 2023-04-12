//
//  FAQ.swift
//  CryptoWallet
//
//  Created by Pavel Boltromyuk on 12.04.23.
//

import Foundation

enum FAQ: CaseIterable {
    case cryptoWallet
    case typeWallet
    case benefitsWallet
}

extension FAQ {

    var title: String {
        switch self {
        case .cryptoWallet:
            return "What are mobile crypto wallets?"
        case .typeWallet:
            return "What types of mobile wallets are there?"
        case .benefitsWallet:
            return "Benefits of mobile wallets"
        }
    }

    // swiftlint: disable line_length
    var description: String {
        switch self {
        case .cryptoWallet:
            return """
                        Mobile crypto wallets are software programs that secure users’ funds and allow them to interact with their crypto holdings using their phone or any other internet-connected mobile device. Remember: no matter what kind of wallet you use, your crypto isn’t actually stored inside it. Your funds “live” on the blockchain, and a wallet is merely the conduit through which you can access them.

                        Mobile wallets are of the “hot” variety, meaning they require an active internet connection, as opposed to offline or “cold” wallet types such as hardware wallets. Some other examples of hot wallets include desktop wallets and web wallets, with desktop wallets being the closest analog to mobile wallets. In fact, many mobile wallet providers offer a desktop variant as well.

                        The biggest benefit of a mobile wallet is the convenience of taking your crypto spending power with you anywhere you go. The apps are generally user-friendly, and make it easy to buy, store, swap, spend or otherwise manage your crypto from your mobile device. Keep in mind that best crypto safety practices say you should never keep large amounts of crypto in any hot wallet. That means for optimal security when using a mobile crypto wallet, it’s best to either self-custody your assets (more on that in a minute) or use it in tandem with a secure offline storage method like a hardware wallet.
"""
        case .typeWallet:
            return """
    The primary difference between types of mobile wallets comes down to custodial vs. non-custodial.

    With custodial wallets, your private keys are held by whichever company provides the wallet. Private keys are like the ATM PIN code to your crypto funds, and whoever holds them has total access to their corresponding wallet. Custodial wallets are best for crypto users who prefer to keep things simple, and don’t mind the idea of an exchange or wallet service possessing their keys. Many crypto users, however, are uncomfortable with the idea of a third-party controlling their private keys. Enough that the phrase “not your keys, not your crypto” has become a common refrain among proponents of the other type of wallet, non-custodial wallets. Some well-known custodial wallet providers include Crypto.com, Coinbase and Kraken.

Non-custodial wallets, also known as self-custody wallets, give the holder absolute control over their private keys, and by extension their crypto funds. More experienced or security-conscious crypto users generally prefer self-custody wallets because the responsibility of securing their funds falls on them, not a third party. Non-custodial wallet users effectively become their own banker, which is seen as a plus by some and a drawback by others. Custodial wallet holders also become the sole guardian of their secret recovery phrase. The secret phrase is the only means of recovering funds from a broken or stolen device, so it is paramount that this is kept safe! Non-custodial crypto wallets come in web, software or hardware form. Some well-known providers, in addition to BitPay Wallet, include Trust Wallet, Electrum, Exodus, Edge Wallet, Blockchain.com and MetaMask.
"""
        case .benefitsWallet:
            return """
Mobile wallets offer a nice blend of utility and security. When used in combination with some form of offline (“cold”) crypto storage, you get the flexibility of a mobile wallet with the protection of a cold wallet. Users like mobile wallets for many reasons, including:

Safety: mobile crypto wallets are as secure as any other “hot” wallet
Portability: carry your crypto spending power right in your pocket, anywhere you go
Flexibility: handle most crypto use cases, including buying, storing, swapping, spending, managing and trading
User-friendly: mobile wallet apps are designed to make it easy to access your funds without much technical expertise
"""
        }
    }
}
