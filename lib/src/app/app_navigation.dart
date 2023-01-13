import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/ui/boarding_page.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/bloc/signup_page_bloc.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/boarding',
    routes: [
      GoRoute(
        path: '/boarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => BoardingPageCubit(),
            child: const BoardingPageWidget(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: Duration.zero,
        ),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => SignUpPageBloc(),
            child: const SignUpPageWidget(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween =
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
        ),
      ),
    ],
  );
}
