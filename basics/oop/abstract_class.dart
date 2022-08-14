abstract class User {
  // super
  login(String username) {
    print("common login logic");
  }

  logout();
}

class Admin extends User {
  @override
  login(String username) {
    print("This is Admin logging in");

    super.login(username);
  }

  @override
  logout() {}
}

mixin CommonLogic {}

class NormalUser extends User {
  @override
  login(String username) {
    print(" \n noraml user loggin");
  }

  @override
  logout() {}
}

void main(List<String> args) {
  var admin = Admin();

  User normaluser = NormalUser();

  admin.login("itsadmin");
  normaluser.login("coolguy");
}

// mixin, implements

