import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  final String id;
  final Map<String, String> parameters;
  final List<String> filesPaths;

  Teacher({
    Map<String, String>? parameters,
    List<String>? filesPaths,
  })  : this.id = Uuid().v4(),
        this.parameters = parameters ?? {},
        this.filesPaths = filesPaths ?? [] {
    this.parameters.addAll({
      "Фамилия": "",
      "Имя": "",
      "Отчество": "",
    });
  }

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
