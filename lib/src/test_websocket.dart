import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({super.key});

  @override
  State<TestPageWidget> createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late final WebSocketChannel socket;

  @override
  void initState() {
    super.initState();
    socket = WebSocketChannel.connect(Uri.parse('ws://ws.coinapi.io/v1/'));

    socket.sink.add(
      jsonEncode(
        {
          "type": "hello",
          "apikey": "4FAB951E-9985-42A9-8461-22B0C6964B80",
          "heartbeat": false,
          "subscribe_data_type": ["trade"],
          "subscribe_filter_symbol_id": ["BITSTAMP_SPOT_BTC_USD\$"]
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: socket.stream,
            builder: (context, snapshot) {
              print(socket.closeReason);
              return Text('${snapshot.data}');
            }),
      ),
    );
  }
}
