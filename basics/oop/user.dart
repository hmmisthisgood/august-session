/// inheritence
/// abstraction
/// encapsulation
/// polymorphism

// class & objects

/// keywords: class, extends, this, super, new

class User {
  /// member/class variables : defines what it is

  int id;
  String name;
  String password;
  String dob;
  String bio;

  /// Note: this is the old way of writing constructor
  // User(
  //     {required int id,
  //     required String name,
  //     required String pass,
  //     required String dob,
  //     required String bio}) {
  //   this.id = id;
  //   this.name = name;
  //   this.password = pass;
  //   this.dob = dob;
  //   this.bio = bio;
  // }

  User(
      {required this.id,
      required this.name,
      required this.bio,
      required this.dob,
      required this.password});

  /// mehtods or functions: what it does

  login() {
    print("${this.name} is logging in");
  }

  logout() {}
  createPost() {}
}

void main(List<String> args) {
  var bibek = new User(
    id: 100,
    name: "Bibek bro",
    bio: "xaina",
    dob: '',
    password: '',
  );

  bibek.name = "not bibek";
  bibek.dob = "2025";

  print(bibek.name);

  bibek.login();
  bibek.logout();

  /// User();  is a default constructor
  var arjun = new User(
      id: 111,
      name: "no name",
      password: "stong",
      dob: "2022",
      bio: "xaina"); //
  arjun.login();
  arjun.logout();
}
