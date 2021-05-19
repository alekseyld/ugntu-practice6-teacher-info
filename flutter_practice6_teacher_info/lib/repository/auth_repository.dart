import 'package:flutter_practive6_teacher_info/model/model.dart';
import 'package:localstorage/localstorage.dart';

class AuthRepository {
  final LocalStorage storage = new LocalStorage('auth.json');

  Future<User?> getAuthUser() async {
    final ready = await storage.ready;

    if (!ready) {
      return null;
    }

    final user = storage.getItem("user");

    if (user is Map<String, dynamic>) {
      return User.fromJson(user);
    } else {
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    return storage.setItem("user", user.toJson());
  }

  Future<void> removeUser() async {
    return storage.deleteItem("user");
  }

  Future<User?> authUser(String name, String password) async {
    User? user;

    if (name.toLowerCase() == "admin" && password.toLowerCase() == "admin") {
      user = User(name: "admin", userRole: UserRole.ADMIN);
    } else if (name.toLowerCase() == "teacher" &&
        password.toLowerCase() == "teacher") {
      user = User(name: "teacher", userRole: UserRole.TEACHER);
    }

    if (user != null) {
      await saveUser(user);
    }

    return user;
  }
}
