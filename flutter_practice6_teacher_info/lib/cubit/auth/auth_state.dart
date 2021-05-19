part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authorized extends AuthState {
  final User user;

  Authorized(this.user);

  @override
  List<Object> get props => [user];
}

class NotAuthorized extends AuthState {
  @override
  List<Object> get props => [];
}
