import 'dart:developer';

import 'package:pusher_client/pusher_client.dart';

class CashedListWebSocketService {
  void connect() async {
    PusherOptions options = PusherOptions(
      host: '44.202.53.45',
      wsPort: 6001,
      encrypted: false,
    );
    PusherClient pusher = PusherClient(
      "27be38f20dbd395c3f9a",
      options,
      enableLogging: true,
    );
    await pusher.connect();

    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state?.previousState}, currentState: ${state?.currentState}");
    });
    Channel channel = pusher.subscribe("message-channel");
    channel.bind("MessageSent", (data) {
      log("EVETNT $data");
    });
  }
}
