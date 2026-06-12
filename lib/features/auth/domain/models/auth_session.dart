import 'package:test_flutter_template/features/auth/domain/models/user.dart';

class AuthSession {
  final String token;
  final User user;

  const AuthSession({
    required this.token,
    required this.user,
  });
}
