import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practive6_teacher_info/model/model.dart';
import 'package:flutter_practive6_teacher_info/repository/repository.dart';

part 'teacher_list_state.dart';

class TeacherListCubit extends Cubit<TeacherListState> {
  final TeacherRepository teacherRepository;

  TeacherListCubit({
    required this.teacherRepository,
  }) : super(TeacherListInitial());

  fetchTeachers() async {
    emit(TeacherListLoading());

    final List<Teacher> teachers = await teacherRepository.getTeachers();

    emit(TeacherListLoaded(teachers));

  }
}
