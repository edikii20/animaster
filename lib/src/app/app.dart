import 'package:aniquiz/src/app/app_navigation.dart';
import 'package:aniquiz/src/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../config/colors.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.mainBlack,
          unselectedItemColor: AppColors.mainDisableLight,
          selectedLabelStyle: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: AppNavigation.getRouter(appBloc: context.read<AppBloc>()),
    );
  }
}
