import 'package:flutter/material.dart';

class FutureBScreen extends StatelessWidget {
  const FutureBScreen({Key? key}) : super(key: key);

  Future<List<int>> getDataInFuture() async {
    return [1, 2, 3, 5, 6, 7];
    // throw "some error";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<int>>(
          future: getDataInFuture(),
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            print(snapshot.data);
            if (snapshot.hasError) {
              return Text("Some error occurred");
            }

            if (snapshot.hasData) {
              return Text("Success data");
            }

            return Container();

            ///

            // if (snapshot.connectionState == ConnectionState.done &&
            //     snapshot.hasData) {}
          },
        ),
      ),
    );
  }
}
