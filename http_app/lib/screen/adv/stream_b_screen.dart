import 'dart:async';

import 'package:flutter/material.dart';

class StreamBScreen extends StatefulWidget {
  const StreamBScreen({Key? key}) : super(key: key);

  @override
  State<StreamBScreen> createState() => _StreamBScreenState();
}

class _StreamBScreenState extends State<StreamBScreen> {
  StreamController<int> streamController = StreamController<int>.broadcast();
  int count = 0;

  addDataInStream() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      count = count + 1;
      if (count % 2 == 0) {
        streamController.add(count);
      } else {
        streamController.addError(" this is errro $count");
      }
      if (count == 10) {
        // streamController.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // addDataInStream();
        count = count + 1;
        streamController.add(count);
      }),
      body: Center(
        child: StreamBuilder<int>(
          stream: streamController.stream,
          builder: ((context, snapshot) {
            final cc = snapshot.connectionState;
            if (snapshot.hasData) {
              print(snapshot.data);
              return Text(snapshot.data!.toString());
            }

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
