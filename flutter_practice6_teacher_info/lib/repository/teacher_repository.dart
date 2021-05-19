import 'dart:convert';

import 'package:flutter_practive6_teacher_info/model/model.dart';
import 'package:localstorage/localstorage.dart';

const TEACHER_KEY = "TEACHER_KEY";

class TeacherRepository {
  final LocalStorage storage = new LocalStorage('teachers.json');

  Future<T?> withStorage<T>(T? Function() body) async {
    if (await storage.ready) {
      return body();
    } else {
      return null;
    }
  }

  Future<void> addTeachers([List<Teacher>? param]) async {
    final List<Teacher> teachers = param ?? await getTeachers();

    withStorage(() {
      storage.setItem(TEACHER_KEY, jsonEncode(teachers));
    });
  }

  Future<List<Teacher>> getTeachers() async {
    List<Teacher>? teachers = await withStorage(() {
      final list = storage.getItem(TEACHER_KEY);

      if (list is List<dynamic>) {
        return List<Teacher>.from(list.map((model) => Teacher.fromJson(model)));
      } else {
        return null;
      }
    });

    if (teachers == null || teachers.isEmpty) {
      teachers = [
        Teacher(filesPaths: [])
          ..parameters["Фамилия"] = "Иванов"
          ..parameters["Имя"] = "Иван"
          ..parameters["Отчество"] = "Иванович",
        Teacher(filesPaths: [])
          ..parameters["Фамилия"] = "Семенова"
          ..parameters["Имя"] = "Таисия"
          ..parameters["Отчество"] = "Даниловна",
        Teacher(filesPaths: [])
          ..parameters["Фамилия"] = "Петров"
          ..parameters["Имя"] = "Андрей"
          ..parameters["Отчество"] = "Дмитриевич",
        Teacher(filesPaths: [])
          ..parameters["Фамилия"] = "Рудакова"
          ..parameters["Имя"] = "Яна"
          ..parameters["Отчество"] = "Андреевна",
      ];

      await addTeachers(teachers);
    }

    return teachers;
  }
}
