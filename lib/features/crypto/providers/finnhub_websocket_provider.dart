// lib/providers/finnhub_websocket_provider.dart
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final cryptoPriceStreamProvider = StreamProvider<double>((ref) async* {
  final channel = WebSocketChannel.connect(
    Uri.parse(
      'wss://ws.finnhub.io?token=d1gugi1r01qkdlvqjr6gd1gugi1r01qkdlvqjr70',
    ),
  );

  final symbol = 'BINANCE:BTCUSDT';
  channel.sink.add(jsonEncode({'type': 'subscribe', 'symbol': symbol}));

  await for (final message in channel.stream) {
    final data = jsonDecode(message);
    if (data['type'] == 'trade') {
      final price = (data['data'][0]['p'] as num).toDouble();
      yield price;
    }
  }
});
