part of 'teacher_list_cubit.dart';

abstract class TeacherListState extends Equatable {
  const TeacherListState();
}

class TeacherListInitial extends TeacherListState {
  @override
  List<Object> get props => [];
}

class TeacherListLoading extends TeacherListState {
  @override
  List<Object> get props => [];
}

class TeacherListLoaded extends TeacherListState {
  final List<Teacher> teachers;

  TeacherListLoaded(this.teachers);

  @override
  List<Object> get props => [];
}