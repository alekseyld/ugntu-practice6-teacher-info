import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'teacher_detail_state.dart';

class TeacherDetailCubit extends Cubit<TeacherDetailState> {
  TeacherDetailCubit() : super(TeacherDetailInitial());
}
