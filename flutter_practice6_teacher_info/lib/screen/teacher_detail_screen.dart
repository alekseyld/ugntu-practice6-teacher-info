import 'package:flutter/material.dart';
import 'package:flutter_practive6_teacher_info/model/model.dart';

class TeacherDetailScreen extends StatelessWidget {
  static Route route([Teacher? teacher]) {
    return MaterialPageRoute<void>(
        builder: (_) {
          return TeacherDetailScreen(
              teacher: teacher ?? Teacher(), isEdit: teacher != null);
        });
  }

  final Teacher teacher;
  final bool isEdit;

  TeacherDetailScreen({
    Key? key,
    required this.teacher,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Преподаватель"),
      ),
      body: TeacherForm(teacher: teacher),
    );
  }
}

class TeacherForm extends StatefulWidget {
  final Teacher teacher;

  const TeacherForm({Key? key, required this.teacher}) : super(key: key);

  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, String> parameters;

  @override
  void initState() {
    super.initState();

    parameters = widget.teacher.parameters;
  }

  @override
  Widget build(BuildContext context) {
    final formFields = <Widget>[];

    parameters.forEach((key, value) {
      formFields.add(buildTextField(
        key,
        value,
        ["Фамилия", "Имя", "Отчество"].every((element) => element != key),
      ));
    });

    return Form(
      child: Column(
        children: [
          ...formFields,
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  parameters["Новый параметр"] = "";
                });
              }),
        ],
      ),
    );
  }

  Widget buildTextField(String key, String value, bool isEditKey) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              enabled: isEditKey,
              initialValue: key,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Параметр",
              ),
              validator: (String? value) {
                if (value
                    ?.trim()
                    .isEmpty ?? true) {
                  return '$key is required';
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              initialValue: value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Значение",
              ),
              validator: (String? value) {
                if (value
                    ?.trim()
                    .isEmpty ?? true) {
                  return '$key is required';
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
