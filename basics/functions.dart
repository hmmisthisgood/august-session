main() {
  final num sum = addNumbers(100, 30.6); // positional args
  print("sum after function call: $sum");

  divide(divider: 111, number: 10); // named args
}

num addNumbers(num first, num second) {
  final sum = second + first;
  print(sum);

  return sum;
}

double divide({required num number, required num divider}) {
  final result = number / divider;
  print(result);

  return result;
}
