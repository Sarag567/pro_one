import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pro_one/servies/cubit/cubit_state.dart';
import 'package:pro_one/servies/cubit/news_cubit.dart';
import 'package:pro_one/servies/remote/dio_helper.dart';
import 'package:pro_one/views/busieness/busienss_screen/busienss_page.dart';


import '../servies/remote/shared_prefrences/shared_prefrences.dart';
import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark=CacheHelper.getData('isDark');
  runApp( MyApp(isDark));

}

class MyApp extends StatelessWidget {

final bool? isDark;
MyApp(this.isDark, {super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
      BlocProvider(create: (context)=>NewsCubit()..changeMode(fromShared: isDark))],

        child: BlocConsumer<NewsCubit,NewsState>(listener: (context,state){},builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.teal,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.teal,
                ),
                appBarTheme: const AppBarTheme(
                    backgroundColor: (Colors.teal),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.grey,
                      statusBarBrightness: Brightness.light,

                    ),
                    titleTextStyle: TextStyle(fontSize: 20,
                        color: Colors.black, fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(color: Colors.black87)

                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.grey
                )
            ),
            darkTheme: ThemeData(
                primarySwatch: Colors.teal,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.teal),

                appBarTheme: AppBarTheme(
                    backgroundColor: (HexColor('333739')),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarBrightness: Brightness.light,

                    ),
                    titleTextStyle: const TextStyle(fontSize: 20,
                        color: Colors.white, fontWeight: FontWeight.bold),
                    iconTheme: const IconThemeData(color: Colors.white)

                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.grey,),
                unselectedWidgetColor: Colors.grey,
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: TextTheme(
                )
            ),

            themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

            home: const HomePage(),
          );
        }),
      );
  }
}
