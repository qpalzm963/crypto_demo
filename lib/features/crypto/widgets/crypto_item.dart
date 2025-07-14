import 'package:crypto_app/features/crypto/models/crypto_type.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(1888), 5),
      SalesData(DateTime(1889), 95),
      for (int year = 1900; year <= 2009; year++)
        SalesData(
          DateTime(year),
          (20 + (20 * (year % 10) + year) % 50 + 10 * (year % 2)).toDouble(),
        ),
      SalesData(DateTime(2010), 5),
      SalesData(DateTime(2011), 128),
      SalesData(DateTime(2012), 34),
      SalesData(DateTime(2013), 32),
      SalesData(DateTime(2014), 140),
      SalesData(DateTime(2015), 35),
      SalesData(DateTime(2016), 28),
      SalesData(DateTime(2017), 34),
      SalesData(DateTime(2018), 32),
      SalesData(DateTime(2019), 40),
    ];
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40, child: CryptoType.bitcoin.image),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(CryptoType.bitcoin.name),
              Text('0.4 btc', style: TextStyle(color: Colors.grey.shade700)),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: const DateTimeAxis(isVisible: false),
              primaryYAxis: const NumericAxis(isVisible: false),
              series: <CartesianSeries>[
                // Renders line chart
                LineSeries<SalesData, DateTime>(
                  dataSource: chartData,
                  color: Colors.red,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('\$ 22888.0'),
              Text('-32% ', style: TextStyle(color: Colors.grey.shade700)),
            ],
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
