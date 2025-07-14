// lib/crypto_type.dart
import 'package:flutter/material.dart';

enum CryptoType {
  bitcoin,
  ethereum,
  tether,
  ripple,
  binancecoin,
  solana,
  usdCoin,
  tron,
  dogecoin,
  stakedEther,
  cardano,
  wrappedBitcoin,
  hyperliquid,
  bitcoinCash,
  wrappedSteth,
  sui,
  chainlink,
  leoToken,
  avalanche2,
  stellar,
  usds,
  theOpenNetwork,
  shibaInu,
  weth,
  litecoin,
  wrappedEeth,
  hederaHashgraph,
  binanceBridgedUsdtBnbSmartChain,
  whitebit,
  monero,
  ethenaUsde,
  bitgetToken,
  polkadot,
  coinbaseWrappedBtc,
  uniswap,
  aave,
  pepe,
  piNetwork,
  dai,
  ethenaStakedUsde,
  aptos,
  okb,
  bittensor,
  blackrockUsdInstitutionalDigitalLiquidityFund,
  jitoStakedSol,
  near,
  internetComputer,
  cryptoComChain,
  ethereumClassic,
  ondoFinance,
}

extension CryptoTypeExtension on CryptoType {
  String get id {
    switch (this) {
      case CryptoType.bitcoin:
        return 'bitcoin';
      case CryptoType.ethereum:
        return 'ethereum';
      case CryptoType.tether:
        return 'tether';
      case CryptoType.ripple:
        return 'ripple';
      case CryptoType.binancecoin:
        return 'binancecoin';
      case CryptoType.solana:
        return 'solana';
      case CryptoType.usdCoin:
        return 'usd-coin';
      case CryptoType.tron:
        return 'tron';
      case CryptoType.dogecoin:
        return 'dogecoin';
      case CryptoType.stakedEther:
        return 'staked-ether';
      case CryptoType.cardano:
        return 'cardano';
      case CryptoType.wrappedBitcoin:
        return 'wrapped-bitcoin';
      case CryptoType.hyperliquid:
        return 'hyperliquid';
      case CryptoType.bitcoinCash:
        return 'bitcoin-cash';
      case CryptoType.wrappedSteth:
        return 'wrapped-steth';
      case CryptoType.sui:
        return 'sui';
      case CryptoType.chainlink:
        return 'chainlink';
      case CryptoType.leoToken:
        return 'leo-token';
      case CryptoType.avalanche2:
        return 'avalanche-2';
      case CryptoType.stellar:
        return 'stellar';
      case CryptoType.usds:
        return 'usds';
      case CryptoType.theOpenNetwork:
        return 'the-open-network';
      case CryptoType.shibaInu:
        return 'shiba-inu';
      case CryptoType.weth:
        return 'weth';
      case CryptoType.litecoin:
        return 'litecoin';
      case CryptoType.wrappedEeth:
        return 'wrapped-eeth';
      case CryptoType.hederaHashgraph:
        return 'hedera-hashgraph';
      case CryptoType.binanceBridgedUsdtBnbSmartChain:
        return 'binance-bridged-usdt-bnb-smart-chain';
      case CryptoType.whitebit:
        return 'whitebit';
      case CryptoType.monero:
        return 'monero';
      case CryptoType.ethenaUsde:
        return 'ethena-usde';
      case CryptoType.bitgetToken:
        return 'bitget-token';
      case CryptoType.polkadot:
        return 'polkadot';
      case CryptoType.coinbaseWrappedBtc:
        return 'coinbase-wrapped-btc';
      case CryptoType.uniswap:
        return 'uniswap';
      case CryptoType.aave:
        return 'aave';
      case CryptoType.pepe:
        return 'pepe';
      case CryptoType.piNetwork:
        return 'pi-network';
      case CryptoType.dai:
        return 'dai';
      case CryptoType.ethenaStakedUsde:
        return 'ethena-staked-usde';
      case CryptoType.aptos:
        return 'aptos';
      case CryptoType.okb:
        return 'okb';
      case CryptoType.bittensor:
        return 'bittensor';
      case CryptoType.blackrockUsdInstitutionalDigitalLiquidityFund:
        return 'blackrock-usd-institutional-digital-liquidity-fund';
      case CryptoType.jitoStakedSol:
        return 'jito-staked-sol';
      case CryptoType.near:
        return 'near';
      case CryptoType.internetComputer:
        return 'internet-computer';
      case CryptoType.cryptoComChain:
        return 'crypto-com-chain';
      case CryptoType.ethereumClassic:
        return 'ethereum-classic';
      case CryptoType.ondoFinance:
        return 'ondo-finance';
    }
  }

  Widget get image {
    return Image.network(
      iconUrl,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  String get symbol {
    switch (this) {
      case CryptoType.bitcoin:
        return 'BTC';
      case CryptoType.ethereum:
        return 'ETH';
      case CryptoType.tether:
        return 'USDT';
      case CryptoType.ripple:
        return 'XRP';
      case CryptoType.binancecoin:
        return 'BNB';
      case CryptoType.solana:
        return 'SOL';
      case CryptoType.usdCoin:
        return 'USDC';
      case CryptoType.tron:
        return 'TRX';
      case CryptoType.dogecoin:
        return 'DOGE';
      case CryptoType.stakedEther:
        return 'STETH';
      case CryptoType.cardano:
        return 'ADA';
      case CryptoType.wrappedBitcoin:
        return 'WBTC';
      case CryptoType.hyperliquid:
        return 'HYPE';
      case CryptoType.bitcoinCash:
        return 'BCH';
      case CryptoType.wrappedSteth:
        return 'WSTETH';
      case CryptoType.sui:
        return 'SUI';
      case CryptoType.chainlink:
        return 'LINK';
      case CryptoType.leoToken:
        return 'LEO';
      case CryptoType.avalanche2:
        return 'AVAX';
      case CryptoType.stellar:
        return 'XLM';
      case CryptoType.usds:
        return 'USDS';
      case CryptoType.theOpenNetwork:
        return 'TON';
      case CryptoType.shibaInu:
        return 'SHIB';
      case CryptoType.weth:
        return 'WETH';
      case CryptoType.litecoin:
        return 'LTC';
      case CryptoType.wrappedEeth:
        return 'WEETH';
      case CryptoType.hederaHashgraph:
        return 'HBAR';
      case CryptoType.binanceBridgedUsdtBnbSmartChain:
        return 'BSC-USD';
      case CryptoType.whitebit:
        return 'WBT';
      case CryptoType.monero:
        return 'XMR';
      case CryptoType.ethenaUsde:
        return 'USDE';
      case CryptoType.bitgetToken:
        return 'BGB';
      case CryptoType.polkadot:
        return 'DOT';
      case CryptoType.coinbaseWrappedBtc:
        return 'CBBTC';
      case CryptoType.uniswap:
        return 'UNI';
      case CryptoType.aave:
        return 'AAVE';
      case CryptoType.pepe:
        return 'PEPE';
      case CryptoType.piNetwork:
        return 'PI';
      case CryptoType.dai:
        return 'DAI';
      case CryptoType.ethenaStakedUsde:
        return 'SUSDE';
      case CryptoType.aptos:
        return 'APT';
      case CryptoType.okb:
        return 'OKB';
      case CryptoType.bittensor:
        return 'TAO';
      case CryptoType.blackrockUsdInstitutionalDigitalLiquidityFund:
        return 'BUIDL';
      case CryptoType.jitoStakedSol:
        return 'JITOSOL';
      case CryptoType.near:
        return 'NEAR';
      case CryptoType.internetComputer:
        return 'ICP';
      case CryptoType.cryptoComChain:
        return 'CRO';
      case CryptoType.ethereumClassic:
        return 'ETC';
      case CryptoType.ondoFinance:
        return 'ONDO';
    }
  }

  String get name {
    switch (this) {
      case CryptoType.bitcoin:
        return 'Bitcoin';
      case CryptoType.ethereum:
        return 'Ethereum';
      case CryptoType.tether:
        return 'Tether';
      case CryptoType.ripple:
        return 'XRP';
      case CryptoType.binancecoin:
        return 'BNB';
      case CryptoType.solana:
        return 'Solana';
      case CryptoType.usdCoin:
        return 'USDC';
      case CryptoType.tron:
        return 'TRON';
      case CryptoType.dogecoin:
        return 'Dogecoin';
      case CryptoType.stakedEther:
        return 'Lido Staked Ether';
      case CryptoType.cardano:
        return 'Cardano';
      case CryptoType.wrappedBitcoin:
        return 'Wrapped Bitcoin';
      case CryptoType.hyperliquid:
        return 'Hyperliquid';
      case CryptoType.bitcoinCash:
        return 'Bitcoin Cash';
      case CryptoType.wrappedSteth:
        return 'Wrapped stETH';
      case CryptoType.sui:
        return 'Sui';
      case CryptoType.chainlink:
        return 'Chainlink';
      case CryptoType.leoToken:
        return 'LEO Token';
      case CryptoType.avalanche2:
        return 'Avalanche';
      case CryptoType.stellar:
        return 'Stellar';
      case CryptoType.usds:
        return 'USDS';
      case CryptoType.theOpenNetwork:
        return 'Toncoin';
      case CryptoType.shibaInu:
        return 'Shiba Inu';
      case CryptoType.weth:
        return 'WETH';
      case CryptoType.litecoin:
        return 'Litecoin';
      case CryptoType.wrappedEeth:
        return 'Wrapped eETH';
      case CryptoType.hederaHashgraph:
        return 'Hedera';
      case CryptoType.binanceBridgedUsdtBnbSmartChain:
        return 'Binance Bridged USDT (BNB Smart Chain)';
      case CryptoType.whitebit:
        return 'WhiteBIT Coin';
      case CryptoType.monero:
        return 'Monero';
      case CryptoType.ethenaUsde:
        return 'Ethena USDe';
      case CryptoType.bitgetToken:
        return 'Bitget Token';
      case CryptoType.polkadot:
        return 'Polkadot';
      case CryptoType.coinbaseWrappedBtc:
        return 'Coinbase Wrapped BTC';
      case CryptoType.uniswap:
        return 'Uniswap';
      case CryptoType.aave:
        return 'Aave';
      case CryptoType.pepe:
        return 'Pepe';
      case CryptoType.piNetwork:
        return 'Pi Network';
      case CryptoType.dai:
        return 'Dai';
      case CryptoType.ethenaStakedUsde:
        return 'Ethena Staked USDe';
      case CryptoType.aptos:
        return 'Aptos';
      case CryptoType.okb:
        return 'OKB';
      case CryptoType.bittensor:
        return 'Bittensor';
      case CryptoType.blackrockUsdInstitutionalDigitalLiquidityFund:
        return 'BlackRock USD Institutional Digital Liquidity Fund';
      case CryptoType.jitoStakedSol:
        return 'Jito Staked SOL';
      case CryptoType.near:
        return 'NEAR Protocol';
      case CryptoType.internetComputer:
        return 'Internet Computer';
      case CryptoType.cryptoComChain:
        return 'Cronos';
      case CryptoType.ethereumClassic:
        return 'Ethereum Classic';
      case CryptoType.ondoFinance:
        return 'Ondo';
    }
  }

  String get iconUrl {
    switch (this) {
      case CryptoType.bitcoin:
        return 'https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400';
      case CryptoType.ethereum:
        return 'https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?1696501628';
      case CryptoType.tether:
        return 'https://coin-images.coingecko.com/coins/images/325/large/Tether.png?1696501661';
      case CryptoType.ripple:
        return 'https://coin-images.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1696501442';
      case CryptoType.binancecoin:
        return 'https://coin-images.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970';
      case CryptoType.solana:
        return 'https://coin-images.coingecko.com/coins/images/4128/large/solana.png?1718769756';
      case CryptoType.usdCoin:
        return 'https://coin-images.coingecko.com/coins/images/6319/large/usdc.png?1696506694';
      case CryptoType.tron:
        return 'https://coin-images.coingecko.com/coins/images/1094/large/tron-logo.png?1696502193';
      case CryptoType.dogecoin:
        return 'https://coin-images.coingecko.com/coins/images/5/large/dogecoin.png?1696501409';
      case CryptoType.stakedEther:
        return 'https://coin-images.coingecko.com/coins/images/13442/large/steth_logo.png?1696513206';
      case CryptoType.cardano:
        return 'https://coin-images.coingecko.com/coins/images/975/large/cardano.png?1696502090';
      case CryptoType.wrappedBitcoin:
        return 'https://coin-images.coingecko.com/coins/images/7598/large/wrapped_bitcoin_wbtc.png?1696507857';
      case CryptoType.hyperliquid:
        return 'https://coin-images.coingecko.com/coins/images/50882/large/hyperliquid.jpg?1729431300';
      case CryptoType.bitcoinCash:
        return 'https://coin-images.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png?1696501932';
      case CryptoType.wrappedSteth:
        return 'https://coin-images.coingecko.com/coins/images/18834/large/wstETH.png?1696518295';
      case CryptoType.sui:
        return 'https://coin-images.coingecko.com/coins/images/26375/large/sui-ocean-square.png?1727791290';
      case CryptoType.chainlink:
        return 'https://coin-images.coingecko.com/coins/images/877/large/chainlink-new-logo.png?1696502009';
      case CryptoType.leoToken:
        return 'https://coin-images.coingecko.com/coins/images/8418/large/leo-token.png?1696508607';
      case CryptoType.avalanche2:
        return 'https://coin-images.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1696512369';
      case CryptoType.stellar:
        return 'https://coin-images.coingecko.com/coins/images/100/large/fmpFRHHQ_400x400.jpg?1735231350';
      case CryptoType.usds:
        return 'https://coin-images.coingecko.com/coins/images/39926/large/usds.webp?1726666683';
      case CryptoType.theOpenNetwork:
        return 'https://coin-images.coingecko.com/coins/images/17980/large/photo_2024-09-10_17.09.00.jpeg?1725963446';
      case CryptoType.shibaInu:
        return 'https://coin-images.coingecko.com/coins/images/11939/large/shiba.png?1696511800';
      case CryptoType.weth:
        return 'https://coin-images.coingecko.com/coins/images/2518/large/weth.png?1696503332';
      case CryptoType.litecoin:
        return 'https://coin-images.coingecko.com/coins/images/2/large/litecoin.png?1696501400';
      case CryptoType.wrappedEeth:
        return 'https://coin-images.coingecko.com/coins/images/33033/large/weETH.png?1701438396';
      case CryptoType.hederaHashgraph:
        return 'https://coin-images.coingecko.com/coins/images/3688/large/hbar.png?1696504364';
      case CryptoType.binanceBridgedUsdtBnbSmartChain:
        return 'https://coin-images.coingecko.com/coins/images/35021/large/USDT.png?1707233575';
      case CryptoType.whitebit:
        return 'https://coin-images.coingecko.com/coins/images/27045/large/wbt_token.png?1696526096';
      case CryptoType.monero:
        return 'https://coin-images.coingecko.com/coins/images/69/large/monero_logo.png?1696501460';
      case CryptoType.ethenaUsde:
        return 'https://coin-images.coingecko.com/coins/images/33613/large/usde.png?1733810059';
      case CryptoType.bitgetToken:
        return 'https://coin-images.coingecko.com/coins/images/11610/large/Bitget_logo.png?1736925727';
      case CryptoType.polkadot:
        return 'https://coin-images.coingecko.com/coins/images/12171/large/polkadot.png?1696512008';
      case CryptoType.coinbaseWrappedBtc:
        return 'https://coin-images.coingecko.com/coins/images/40143/large/cbbtc.webp?1726136727';
      case CryptoType.uniswap:
        return 'https://coin-images.coingecko.com/coins/images/12504/large/uniswap-logo.png?1720676669';
      case CryptoType.aave:
        return 'https://coin-images.coingecko.com/coins/images/12645/large/aave-token-round.png?1720472354';
      case CryptoType.pepe:
        return 'https://coin-images.coingecko.com/coins/images/29850/large/pepe-token.jpeg?1696528776';
      case CryptoType.piNetwork:
        return 'https://coin-images.coingecko.com/coins/images/54342/large/pi_network.jpg?1739347576';
      case CryptoType.dai:
        return 'https://coin-images.coingecko.com/coins/images/9956/large/Badge_Dai.png?1696509996';
      case CryptoType.ethenaStakedUsde:
        return 'https://coin-images.coingecko.com/coins/images/33669/large/sUSDe-Symbol-Color.png?1716307680';
      case CryptoType.aptos:
        return 'https://coin-images.coingecko.com/coins/images/26455/large/aptos_round.png?1696525528';
      case CryptoType.okb:
        return 'https://coin-images.coingecko.com/coins/images/4463/large/WeChat_Image_20220118095654.png?1696505053';
      case CryptoType.bittensor:
        return 'https://coin-images.coingecko.com/coins/images/28452/large/ARUsPeNQ_400x400.jpeg?1696527447';
      case CryptoType.blackrockUsdInstitutionalDigitalLiquidityFund:
        return 'https://coin-images.coingecko.com/coins/images/36291/large/blackrock.png?1711013223';
      case CryptoType.jitoStakedSol:
        return 'https://coin-images.coingecko.com/coins/images/28046/large/JitoSOL-200.png?1696527060';
      case CryptoType.near:
        return 'https://coin-images.coingecko.com/coins/images/10365/large/near.jpg?1696510367';
      case CryptoType.internetComputer:
        return 'https://coin-images.coingecko.com/coins/images/14495/large/Internet_Computer_logo.png?1696514180';
      case CryptoType.cryptoComChain:
        return 'https://coin-images.coingecko.com/coins/images/7310/large/cro_token_logo.png?1696507599';
      case CryptoType.ethereumClassic:
        return 'https://coin-images.coingecko.com/coins/images/453/large/ethereum-classic-logo.png?1696501717';
      case CryptoType.ondoFinance:
        return 'https://coin-images.coingecko.com/coins/images/26580/large/ONDO.png?1696525656';
    }
  }
}
