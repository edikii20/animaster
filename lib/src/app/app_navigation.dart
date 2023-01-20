import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/ui/boarding_page.dart';
import 'package:aniquiz/src/pages/start_pages/confirm_email_code_page/cubit/confirm_email_code_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/cubit/forgot_password_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/ui/forgot_password_page.dart';
import 'package:aniquiz/src/pages/start_pages/login_page/ui/login_page.dart';
import 'package:aniquiz/src/pages/start_pages/new_password_page/cubit/new_password_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/new_password_page/ui/new_password_page.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/cubit/signup_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/start_pages/confirm_email_code_page/ui/confirm_email_code_page.dart';
import '../pages/start_pages/login_page/cubit/login_page_cubit.dart';

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
            create: (_) => SignUpPageCubit(),
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => LogInPageCubit(),
            child: const LogInPageWidget(),
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/forgot_password',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => ForgotPasswordPageCubit(),
            child: const ForgotPasswordPageWidget(),
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/confirm_email_code',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => ConfirmEmailCodePageCubit(),
            child: const ConfirmEmailCodePageWidget(),
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
      GoRoute(
        path: '/new_password',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: BlocProvider(
            create: (_) => NewPasswordPageCubit(),
            child: const NewPasswordPageWidget(),
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
          transitionDuration: const Duration(milliseconds: 200),
        ),
      ),
    ],
  );
}
