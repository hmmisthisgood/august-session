main() {
  var amount;

  amount = 10000;

  /// Numerical data types : int , double , num
  /// explcit/direct type defifintion
  int price = 1000;
  price = 10;

  /// indirect type difinition
  var discount = 10.0;

  // price = 10.0;
  /*
this 
is 
multi line 
comment
  */

  double interst = 198.32;
  interst = 100; // 100.0

  print(interst);

  /// for all kind of numbers
  num randomNum = 1000;
  randomNum = 12.233323;
  randomNum.floor();

  String name = "Bibek";
  name = 'John';
  String multiLine = '''$name  ${randomNum.floor()} this 
  is  
  a 
  multiline 
  string
  ''';

  print(multiLine);

  print(name.toUpperCase());

// bool

  bool isSunday = true; // true, false
  bool isTuesday = false;

  var isMonday = "false";

  dynamic changes = "I can change";

  // changes.lol();

  changes = 10;
  // changes = changes + "a";
  print(changes);

  final int currentYear = 2022;

  const double pi = 3.1415;

  final currentTime = DateTime.now();

  print(currentTime);
}


/// int , double, num
/// String 
/// bool 
/// dynamic: dangeroues data type
/// 

/// final , const  