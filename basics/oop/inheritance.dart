// extends , super, implements, mixin

class User {
  /// user's properties
  final int id;
  final String name;
  final String password;
  final String dob;
  final String bio;
  final String? role;

  static String country = "Nepal";
  static int activeNumber = 0;

  User(
      {required this.id,
      required this.name,
      required this.password,
      required this.dob,
      required this.bio,
      this.role});

  /// actions performed by user
  login() {
    activeNumber++;

    print("$name is logged in");
  }

  logout() {
    activeNumber++;
    print("$name is logged out");
  }
}

class Admin extends User {
  // Admin(
  //     {required super.id,
  //     required super.name,
  //     required super.password,
  //     required super.dob,
  //     required super.bio});

  Admin(
      {required int id,
      required String name,
      required String password,
      required String dob,
      required String bio})
      : super(bio: bio, name: name, id: id, password: password, dob: dob);
  deletePost() {}
  kickOut() {}
}

class Moderator extends Admin {
  Moderator(
      {required super.id,
      required super.name,
      required super.password,
      required super.dob,
      required super.bio});
}

class SuperPowerfulAdmin extends Admin {
  SuperPowerfulAdmin(
      {required super.id,
      required super.name,
      required super.password,
      required super.dob,
      required super.bio});

  groupDelete() {
    print("$name can delete group");
  }

  removeModerator() {
    print("$name remove moderator");
  }

  @override
  login() {
    // super admin login logic
    super.login();

    ///
  }
}

class NormalUser extends User {
  NormalUser(
      {required super.id,
      required super.name,
      required super.password,
      required super.dob,
      required super.bio});

  leaveGroup() {}
}

main() {
  Moderator moderator = Moderator(
      id: 1111,
      name: "RamBahadur@Admin",
      password: "password",
      dob: 'dob',
      bio: 'bio');

  SuperPowerfulAdmin superPowerfulAdmin = SuperPowerfulAdmin(
      id: 1111,
      name: "good@Admin",
      password: "password",
      dob: 'dob',
      bio: 'bio');

  var normalUser = NormalUser(
      id: 1111,
      name: "good@Admin",
      password: "password",
      dob: 'dob',
      bio: 'bio');

  /// common functions
  moderator.deletePost();
  moderator.kickOut();

  moderator.login();

  superPowerfulAdmin.login();

  superPowerfulAdmin.deletePost();
  superPowerfulAdmin.kickOut();

  /// only super admin's funcions
  superPowerfulAdmin.groupDelete();
  superPowerfulAdmin.removeModerator();

  moderator.login();
  moderator.logout();

  moderator.name;

  print(User.country);

  // admin.country;
  // superAdmin.country;

  // NormalUser normalUser = NormalUser();

  User.activeNumber;

  // normalUser.login();
  // normalUser.logout();

  bool isSA = superPowerfulAdmin is User;

  bool isModeratorSA = moderator is SuperPowerfulAdmin;

  print(isSA);
  print(isModeratorSA);
}
