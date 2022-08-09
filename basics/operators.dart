main() {
// operand: a , b
// opertaor:  +, -, *, / =

  int sum = 10 + 30; // + oprator , 10 : operand
  int product = 10 * 10;
  double divison = 10 / 2;
  num modulus = 10 % 3; // gets the reminder of divison

  /// comparisoin: <,>, <=, >= , ==, !=  . returns boolen value

  var result = 1 > 2;
  print(result);

  /// and: && , or: || , not: !
  final day = "tuesday";

  final number = 10;

  bool logicResult = number > 0 || number < 9;

  bool reverse = !true;
  print(reverse);

  print("the logic result is : $logicResult ");

//  unary : ++ , --

  int count = 0;

  count += 1; // count=count+1;
  count -= 1; // count = count-1;

  count++; // postfix operator

  ++count; // count= count+1; prefix operator

  --count;
  count--;

  int a = 10;
  int b = 20;

  int c = a + b;

  // var summ= ab+; // +ab;

  /// arthemetic opertaors
  /// logical operators
  /// comparison operators
  /// unary/binary operators

  /// ternary operator
  ///  (conditon)? success case: failure case;
  (day != "wednesday") ? print("today is tudsay") : print("not tuesday");

  // null related opeators : ?, ??, ?. !, late
}
