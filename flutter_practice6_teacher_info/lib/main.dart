import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practive6_teacher_info/cubit/cubit.dart';
import 'package:flutter_practive6_teacher_info/repository/repository.dart';
import 'package:flutter_practive6_teacher_info/screen/auth_screen.dart';
import 'package:flutter_practive6_teacher_info/screen/teacher_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cбор информации от преподавателей',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => AuthRepository()),
          RepositoryProvider(create: (context) => TeacherRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(
                authRepository: RepositoryProvider.of(context),
              )..initAuth(),
            )
          ],
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is NotAuthorized) {
                return AuthScreen();
              }

              if (state is Authorized) {
                return TeacherListScreen();
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
