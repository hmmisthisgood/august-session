main() {
  List<String> names = ["a", "b", "c", "d"];

  /// for
  int count = 0;
  for (count; count < 10;) {
    // final name = names[count];

    if (count == 8) {
      break;
    }

    if (count == 5) {
      count = count + 1;

      continue;
    }

    print(count);
    // count++;
    count = count + 1;
  }

  final factorailValue = factorail(10);
  print(factorailValue);

  print(" please run this");

  // print(count);

  /// for in

  for (String item in names) {
    print(item);
  }

  /// forEach
  names.forEach(
    (item) {
      print("item in for each: $item");
    },
  );

  int whileCounter = 0;

  while (whileCounter < 10) {
    print("simplest infinte loop: $whileCounter");
    whileCounter++;
  }
  int doCounter = 10;

  do {
    doCounter--;
  } while (doCounter > 0);
}

// for , while, do while, break, continue
// num =9
// 10*   9*  8* 7*6*5...2, 1
int factorail(int num) {
  // 10 , num-1= 9
  print("roound: $num");
  return num == 1 ? 1 : num * factorail(num - 1);
}

// 0 1 2 3 5 8 13 ......