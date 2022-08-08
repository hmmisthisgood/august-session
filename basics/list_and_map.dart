main() {
  var random = [
    1,
    23,
    'BIBEK',
    [1, 32, 43],
    121.33
  ];

  List<String> names = ["john", "bibek", "ram"]; // length= 3
  ////////////////////// 0 ,       1,       2

  /// fetching values from list
  var first = names[0];
  names.first;

  final last = names[2];
  names.last;

  print(names);

  /// appends to the list
  names.add("jeff");
  names.add('ram');

  print(names);

  names.insert(0, "I am first");
  print(names);

  names.remove("john");

  print(names);
  // names.removeAt(5);
  print(names);

  final johnExists = names.contains("john");

  Set setExample = {"ram", "ram", "ram"};
  print(setExample);
  final namesSet = names.toSet();
  print(namesSet);

  /// Map

  final Map<String, dynamic> person = {
    "hobbies": ["gaming", "coding"],
    "name": "Jack", // key value pair or MapEntry
    "username": "iamjack",
    "age": 10,
    // 1: 2,
    // []: 2.3
  };

  final nameeee = person["name"];
  person["name"] = "Not jack";

  person["image"] = "https://image.jpg";

  person.addEntries([
    MapEntry("skills", ["c", "c++"])
  ]);

  person.remove("image");

  person.clear();
}

/// List , Set , Map
