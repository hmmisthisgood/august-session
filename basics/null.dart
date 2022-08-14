main() {
  String firstName = "Jack"; // non-nullable
  String lastName = "Sharma";

  late String fullname;

  String? middleName; // nullable

  var small = firstName.toLowerCase();

  int? length = middleName?.length; // could be null

  String newname = middleName ?? "";

  // int forcefulLength = middleName!.length;
  // ! ignores null
  /// ! is dangerous, use only when you are sure, the value is not null
  middleName = "";
  fullname = firstName + " " + middleName + " " + lastName;

  if (middleName != null) {
    var upper = middleName.toUpperCase();
  }

  print(fullname);
}

/// null reated: String? , int?, User?
/// Operators: ?.  , ?? , !
/// late 