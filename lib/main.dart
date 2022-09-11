import 'package:as7app/network/local/cache_helper.dart';
import 'package:as7app/shared/components/constants.dart';
import 'package:as7app/shared/cubit/app_cubit.dart';
import 'package:as7app/shared/cubit/states.dart';
import 'package:as7app/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'cubit/cubit.dart';
import 'firebase_options.dart';
import 'layout/social_home_layout.dart';
import 'modules/loginScreen/login_screen.dart';

void main() async{
  //to confirm that everything in method is fine to open app
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();

  Widget? widget;

  uId = CacheHelper.getData(key: 'uId');

  (uId != null) ? widget = SocialLayout() : widget = LoginScreen();

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (context) => AppCubit(),
        ),
        BlocProvider(
        create: (context) => SocialCubit()..getUserData(),
        ),

    ], child: BlocConsumer<AppCubit, AppState>
      (
        listener: (context, state){},
        builder: (context, state) =>
            MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lighttheme,
              darkTheme: darktheme,
              themeMode:
              // AppCubit.get(context).isDark ? ThemeMode.dark :
              ThemeMode.light,
              home: SplashScreenView(
                navigateRoute: startWidget,
                duration: 5000,
                imageSize: 130,
                // you must add image path first on pubspec.yaml
                imageSrc: "assets/images/splashScreen.png",
                text: "As7app",
                textType: TextType.ColorizeAnimationText,
                textStyle: const TextStyle(
                  fontSize: 70.0,
                  fontStyle: FontStyle.normal,
                ),
                colors: const [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                backgroundColor: Colors.yellow,
              ),
            )
    ));


  }
}

