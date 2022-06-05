import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/task/data/dio_helper.dart';
import 'package:task/task/domain/taskcubit_cubit.dart';
import 'package:task/task/presentation/pages/task_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskcubitCubit()..getHomeData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const TaskPage(),
      ),
    );
  }
}

