import 'user.dart';

main() {
  User testUser =
      User(id: 111, name: "name", bio: "bio", dob: "dob", pass: "pass");

  print(testUser.getPassword());

  testUser.setPassword("new password");
  print(testUser.getPassword());

  /// using dart's gtter setter

  print("password using dart getter: ${testUser.password}");
  testUser.password = "pass using dart setter";
  print("password using dart getter: ${testUser.password}");

  testUser.password; // getter
  testUser.password = "this is a setter"; //setter
  testUser.login();
  testUser.logout();
  // testUser._privateFunc();
}
