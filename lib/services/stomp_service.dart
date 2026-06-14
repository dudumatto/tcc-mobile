import 'dart:async';
import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class StompService {
  StompService({required this.wsUrl, required this.token});

  final String wsUrl;
  final String token;
  StompClient? _client;
  final StreamController<Map<String, dynamic>> _messagesController =
      StreamController.broadcast();
  final StreamController<Map<String, dynamic>> _notificationsController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get messages => _messagesController.stream;
  Stream<Map<String, dynamic>> get notifications => _notificationsController.stream;

  void connect() {
    _client = StompClient(
      config: StompConfig(
        url: wsUrl,
        onConnect: _onConnect,
        onWebSocketError: (_) {},
        reconnectDelay: const Duration(seconds: 5),
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
      ),
    );
    _client?.activate();
  }

  void _onConnect(StompFrame _) {
    _client?.subscribe(
      destination: '/user/queue/messages',
      callback: (frame) {
        if (frame.body != null) {
          _messagesController.add({'body': frame.body!});
        }
      },
    );
    _client?.subscribe(
      destination: '/user/queue/notifications',
      callback: (frame) {
        if (frame.body != null) {
          _notificationsController.add({'body': frame.body!});
        }
      },
    );
  }

  void sendMessage(Map<String, dynamic> payload) {
    _client?.send(destination: '/app/chat.send', body: jsonEncode(payload));
  }

  void disconnect() {
    _client?.deactivate();
  }

  void dispose() {
    disconnect();
    _messagesController.close();
    _notificationsController.close();
  }
}
