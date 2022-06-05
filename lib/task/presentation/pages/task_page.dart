import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/taskcubit_cubit.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskcubitCubit, TaskcubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = TaskcubitCubit.get(context);
          return (state is SuccessDataState)
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      buildCarouselSlider(context),
                      buildContainer(cubit),
                    SizedBox(height: 12,),
                    Container(
                      color: Colors.purple,
                      width: double.infinity,
                      height:50,
                      child: TextButton(
                        onPressed: () {
                          cubit.getHomeData();
                        },
                        child: Text("قم بالحجز الآن",style: TextStyle(color: Colors.white,fontSize: 20),),

                      ),

                    ),
            SizedBox(
              height: 20,
            ),
                      SizedBox(
                        height: 20,
                      ),

                    ]
              )): const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Container buildContainer(TaskcubitCubit cubit) {
    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                      children:[

                      const SizedBox(
                      height: 8,
                    ),
                      Text(
                        "${cubit.dataModel.interest} #  ",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "${cubit.dataModel.title}   ",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.date}   ",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          const Icon(Icons.date_range),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.address}   ",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          const Icon(Icons.location_on),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.trainerName}   ",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                          const CircleAvatar(
                            radius: 12,
                            child: Icon(Icons.person),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${cubit.dataModel.trainerInfo}   ",
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "${'عن الدوره'}   ",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "${cubit.dataModel.occasionDetail}   ",
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        height: 6,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "${'تكلفه الدوره'}   ",
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.price}   ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "${'الحجز العادي'}   ",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.price}   ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "${'الحجز السريع'}   ",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "${cubit.dataModel.price}   ",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "${'الحجز المميز'}   ",
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),



                      ],
                    ),


                      ],
                    ),



              );
  }

  CarouselSlider buildCarouselSlider(BuildContext context) {
    return CarouselSlider(
        items: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: const NetworkImage(
                  'https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg?w=2000'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              //  fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: const NetworkImage(
                  'https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg?w=2000'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              //  fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Expanded(
              child: Image(
                image: const NetworkImage(
                    'https://img.freepik.com/free-photo/grunge-paint-background_1409-1337.jpg?w=2000'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                //  fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height / 3,

          //aspectRatio: 16 / 9,
          // viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 20),
          //    autoPlayAnimationDuration: const Duration(milliseconds: 10000),
          //  autoPlayCurve: Curves.fastOutSlowIn,
          // enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ));
  }
}
