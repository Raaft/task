part of 'taskcubit_cubit.dart';

@immutable
abstract class TaskcubitState {}

class TaskcubitInitial extends TaskcubitState {}

class ErrorDataState extends TaskcubitState {}

class LoadingDataState extends TaskcubitState {}

class SuccessDataState extends TaskcubitState {
  final DataModel model;

  SuccessDataState(this.model);
}