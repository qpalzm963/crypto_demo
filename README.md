# crypto_app

# Flutter Crypto Chart Demo

本專案為 Flutter 開發的加密貨幣走勢圖 Demo，  
同時支援「K線圖」與「折線圖」切換，並支援主流交易區間、成交量顯示，  
數據來源為 [Binance API](https://binance-docs.github.io/apidocs/spot/en/) 及 [CoinGecko API](https://www.coingecko.com/zh/api)。

---

## 🚀 專案功能特色

- 支援 K 線圖與折線圖/面積圖切換（專業幣圈 UI ）
- Binance K線圖：多種時間區間（1m/5m/1h/1d/1w 等）
- CoinGecko 折線圖：支援 24h、7d、30d、90d、1y、Max
- 圖表下方顯示**成交量柱狀圖**
- 支援縮放、拖曳、Trackball（滑動顯示精確價格與時間）
- 點選 K 棒時，底部即時顯示該根詳細時間
- 多 Provider、Hook 狀態管理最佳實踐
- 程式碼乾淨易於擴充

---

## 📦 主要技術棧

- Flutter 3.x+
- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)
- [flutter_hooks](https://pub.dev/packages/flutter_hooks)
- [syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts)
- [dio](https://pub.dev/packages/dio)
- [intl](https://pub.dev/packages/intl)（小數/時間格式）

---

## 🔥 使用說明

1. 下載或 clone 本專案
    ```sh
    git clone https://github.com/qpalzm963/crypto_demo.git
    cd crypto_demo
    ```

2. 安裝套件
    ```sh
    flutter pub get
    ```

3. 執行專案
    ```sh
    flutter run
    ```
---

## 📊 圖片預覽

| K線圖（含成交量）         | 折線圖（含成交量）         |
|:------------------------:|:-------------------------:|
| ![](https://github.com/user-attachments/assets/78262107-d87f-4e48-9ef8-b4bcc5072d53) | ![](https://github.com/user-attachments/assets/a0fad8a6-9950-4847-8eae-1d55e5fd5f91) |

（請自行補上 `screenshots` 頁面圖檔）

---

## 🔗 資料來源

- [Binance Spot API](https://binance-docs.github.io/apidocs/spot/en/#kline-candlestick-data)
- [CoinGecko Market Chart API](https://www.coingecko.com/zh/api/documentation)

---

## ⚙️ 參數調整

- 預設顯示幣種、K線區間可直接在 `pages/coin_detail_page.dart` 修改
- 你可以依需求擴充支援多幣種切換、主題色調、加上漲跌色等

---

## 👨‍💻 聯絡/討論

有任何建議、功能需求，或技術問題，歡迎提 issue 或 PR！

<img width="450" height="950" alt="Simulator Screenshot - iPhone 16 - 2025-07-15 at 10 20 44" src="https://github.com/user-attachments/assets/df632bd7-0451-4b23-8dd4-9e6008584c8a" />
<img width="450" height="950" alt="Simulator Screenshot - iPhone 16 - 2025-07-15 at 10 20 52" src="https://github.com/user-attachments/assets/a0fad8a6-9950-4847-8eae-1d55e5fd5f91" />
<img width="450" height="950" alt="Simulator Screenshot - iPhone 16 - 2025-07-15 at 10 21 09" src="https://github.com/user-attachments/assets/78262107-d87f-4e48-9ef8-b4bcc5072d53" />
