/// read from a file
///
///

/// async , await
/// Future, then , catchError

main() async {
  print("1");

  try {
    var data = await fetchDataFromServer();

    var sum = 1 + data;

    print("sum : $sum");

    // data.then((response) {
    //   var sum = 1 + response;
    //   print("sum : $sum");
    // });

    // data.catchError((e) {
    //   print(e);
    // });

  } catch (e) {
    /// catch error
    print(e);
  }

  print("3");
}

Future<int> fetchDataFromServer() async {
  print("2.Stareted data fetch from server");
  await Future.delayed(Duration(seconds: 2), () {
    print("I am delayed by 2 seonds");
  });

  print("Am I delayed?");

  // return 100;
  throw "an error occurred";
}

//  Things that could be asynchronous
/// 1. File opeartions, I/O operations
/// 2. Network api call
/// 3. Databse operations
