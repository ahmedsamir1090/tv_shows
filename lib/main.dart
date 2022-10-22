import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';
import 'package:tv_shows/shared/bloc_observ.dart';
import 'package:tv_shows/shared/injection.dart';
import 'package:tv_shows/view_model/cubit/hotd_cubit.dart';
import 'package:tv_shows/view_model/view_model.dart';
import 'package:tv_shows/views/home/main_view_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  initGit();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding());
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HotdCubit>()..getInfo(),
      child: BlocConsumer<HotdCubit, HotdState>(
        builder: (context, state) => Sizer(
          builder: (context, orientation, deviceType) => MaterialApp(
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              primarySwatch: Colors.blueGrey,
              primaryColor: Colors.redAccent,
              scaffoldBackgroundColor: Colors.white10,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.red,
                centerTitle: true,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              backgroundColor: Colors.red,
              brightness: Brightness.dark,
              textSelectionTheme:
                  const TextSelectionThemeData(selectionColor: Colors.blue),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  height: .15.h,
                  fontWeight: FontWeight.w300,
                  fontFamily: "RobotoMono",
                ),
                headline1: TextStyle(
                    fontFamily: "JosefinSans",
                    fontSize: 18.sp,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            darkTheme: ThemeData.dark(),
            home: HomeView(ViewModel()),
            debugShowCheckedModeBanner: false,
            routes: {
              HomeView.id: (context) => HomeView(ViewModel()),
            },
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
