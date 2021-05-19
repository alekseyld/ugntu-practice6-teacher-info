import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practive6_teacher_info/cubit/cubit.dart';
import 'package:flutter_practive6_teacher_info/repository/repository.dart';
import 'package:flutter_practive6_teacher_info/model/model.dart';
import 'package:flutter_practive6_teacher_info/screen/teacher_detail_screen.dart';

class TeacherListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Список преподавателей"),
      ),
      body: BlocProvider(
        create: (context) => TeacherListCubit(
          teacherRepository: RepositoryProvider.of<TeacherRepository>(context),
        )..fetchTeachers(),
        child: BlocBuilder<TeacherListCubit, TeacherListState>(
          builder: (context, state) {
            if (state is TeacherListLoaded) {
              return ListView(
                children: state.teachers.map(
                  (teacher) {
                    return buildTeacherListItem(context, teacher);
                  },
                ).toList(),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: isUserAdmin(context)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, TeacherDetailScreen.route());
              },
            )
          : null,
    );
  }

  Widget buildTeacherListItem(BuildContext context, Teacher teacher) {
    final line =
        "${teacher.parameters["Фамилия"]} ${teacher.parameters["Имя"]} ${teacher.parameters["Отчество"]}";

    return ListTile(
      onTap: () {
        Navigator.push(context, TeacherDetailScreen.route(teacher));
      },
      title: Text(line),
    );
  }

  bool isUserAdmin(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context).isAuthorized;
}
