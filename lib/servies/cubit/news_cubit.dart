import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_one/servies/cubit/cubit_state.dart';
import 'package:pro_one/servies/remote/shared_prefrences/shared_prefrences.dart';
import 'package:pro_one/views/busieness/busienss_screen/busienss_page.dart';
import 'package:pro_one/views/science/science_screen.dart';
import 'package:pro_one/views/settings/settings_screens/setting_page.dart';
import 'package:pro_one/views/sports/sports_screen/sports_page.dart';

import '../remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super (InitialState());
static NewsCubit get(context)=>BlocProvider.of(context);
int currentIndex=0;
List <BottomNavigationBarItem>bottoms=[
  const BottomNavigationBarItem(icon:Icon(Icons.business),
  label: 'Business'),
  const BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
  const BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
];
List<Widget>screens=[const BusinessPage(),const SportsPage(),const SciencePage()];
void changeBottom(int index)
{
  currentIndex=index;
  if (index==1)
    getSports();
  if(index==2)
    getScience();
    emit(NewsBottomNav());
}
List<dynamic>business=[];
List<dynamic>sports=[];
List<dynamic>science=[];

  void getBusiness()
  {
    emit(LoadState());
    DioHelper.getData(url:'v2/top-headlines', query: {'country':'eg',
      'category':'business','apikey':'9cc6fe3806e24c928dcbe49841120d90'}).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(PassStateBusiness());

    }
    )
        .catchError((error) {
      print(error.toString());
      emit(FailStateBusiness(error.toString()));
    });
  }
  void getSports() {
    emit(LoadSportsState());
    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {'country': 'eg',
        'category': 'sports', 'apikey': '9cc6fe3806e24c928dcbe49841120d90'})
          .then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(PassSportsState());
      }
      )
          .catchError((error) {
        print(error.toString());
        emit(FailSportsState(error.toString()));
      });
    }
    else{
      emit(PassSportsState());
    }
  }
  void getScience() {
    emit(LoadscienceState());
    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {'country': 'eg',
        'category': 'science', 'apikey': '9cc6fe3806e24c928dcbe49841120d90'})
          .then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(PassScienceState());
      }
      )
          .catchError((error) {
        print(error.toString());
        emit(FailScienceState(error.toString()));
      });
    }else{
      emit(PassScienceState());
    }
  }
bool isDark=false;
  void changeMode({ bool? fromShared}){
    if(fromShared!=null) {
      isDark=fromShared;
    } else {
      isDark=!isDark;
    }

    CacheHelper.putData('isDark', isDark).then((value) =>emit(AppChangeMode()) );

  }List<dynamic>Search=[];
  void getSearchMethod(String value){
    emit(LoadSearch());
    Search=[];
    if (Search.length == 0) {
      DioHelper.getData(url: 'v2/everything', query: {
        'category': '$value', 'apikey': '9cc6fe3806e24c928dcbe49841120d90'})
          .then((value) {
        Search = value.data['articles'];
        print(Search[0]['title']);
        emit(PassSearch());
      }
      )
          .catchError((error) {
        print(error.toString());
        emit(FailSearch(error.toString()));
      });
    }else{
      emit(PassSearch());
    }
  }



  }





