import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practive6_teacher_info/cubit/auth/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _loginKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Авторизация",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 32),
                TextFormField(
                  key: _loginKey,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Login is required';
                    }
                  },
                ),
                SizedBox(height: 8),
                TextFormField(
                  key: _passwordKey,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Password is required';
                    }
                  },
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    child: Text(
                      "Войти",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {

                        final login = _loginKey.currentState!.value;
                        final password = _passwordKey.currentState!.value;

                        BlocProvider.of<AuthCubit>(context).auth(login, password);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
