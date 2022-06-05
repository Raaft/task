import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model.dart';
import '../data/dio_helper.dart';

part 'taskcubit_state.dart';

class TaskcubitCubit extends Cubit<TaskcubitState> {
  TaskcubitCubit() : super(TaskcubitInitial());

  static TaskcubitCubit get(context) => BlocProvider.of(context);

  DataModel dataModel = DataModel();

  void getHomeData() {
    emit(LoadingDataState());

    DioHelper.getData(

    ).then((value) {
      dataModel = DataModel.fromJson(value.data);

      //print(homeModel.data.banners[0].image);
      if (kDebugMode) {
        print(dataModel);
      }

      //print(favorites.toString());

      emit(SuccessDataState(dataModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorDataState());
    });
  }
}
