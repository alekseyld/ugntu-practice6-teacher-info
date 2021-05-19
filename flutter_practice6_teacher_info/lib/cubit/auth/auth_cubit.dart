import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practive6_teacher_info/repository/repository.dart';
import 'package:flutter_practive6_teacher_info/model/model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({
    required this.authRepository,
  }) : super(AuthInitial());

  initAuth() async {

    final user = await authRepository.getAuthUser();

    if (user == null) {
      emit(NotAuthorized());
    } else {
      emit(Authorized(user));
    }
  }

  auth(String login, String password) async {
    await authRepository.authUser(login, password);
    initAuth();
  }

  bool get isAuthorized => state is Authorized;

}
