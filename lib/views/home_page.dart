import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_one/servies/cubit/cubit_state.dart';
import 'package:pro_one/servies/cubit/news_cubit.dart';
import 'package:pro_one/servies/remote/dio_helper.dart';
import 'package:pro_one/servies/search/search+api.dart';

import '../controls/componant/news_componant.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   // return BlocProvider(create: (BuildContext context) => NewsCubit()..getBusiness(),
    //  child: BlocConsumer<NewsCubit, NewsState>(
         // listener: (context, state) {},
         // builder: (context, state) {
    var cubit=NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: const Text(
              'News App ',),
              actions:  [
                IconButton(onPressed:(){
                  navigateTo(context,SearchScreen());
                }, icon: const Icon(Icons.search)),
                IconButton(onPressed: (){
                  NewsCubit.get(context).changeMode();
                }, icon: const Icon(Icons.brightness_2_outlined))
              ],

            ),


              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(currentIndex: cubit.currentIndex,onTap: (index){
              cubit.changeBottom(index);
              },
                items:

                cubit.bottoms,
              )
              ,
            );
          }
  }
