import 'package:aniquiz/src/app/bloc/app_bloc.dart';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:aniquiz/src/pages/main_pages/home_page/ui/home_page.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/ui/boarding_page.dart';
import 'package:aniquiz/src/pages/start_pages/confirm_email_code_page/cubit/confirm_email_code_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/cubit/forgot_password_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/forgot_password_page/ui/forgot_password_page.dart';
import 'package:aniquiz/src/pages/start_pages/loader_page/ui/loader_page.dart';
import 'package:aniquiz/src/pages/start_pages/login_page/ui/login_page.dart';
import 'package:aniquiz/src/pages/start_pages/new_password_page/cubit/new_password_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/new_password_page/ui/new_password_page.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/cubit/signup_page_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/signup_page/ui/signup_page.dart';
import 'package:aniquiz/src/pages/main_pages/home_page/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/start_pages/confirm_email_code_page/ui/confirm_email_code_page.dart';
import '../pages/start_pages/login_page/cubit/login_page_cubit.dart';

abstract class AppNavigation {
  static final List<String> _startPagesRoutes = [
    '/boarding',
    '/signup',
    '/login',
    '/login/forgot-password',
    '/login/forgot-password/confirm-email-code',
    '/login/forgot-password/new-password',
  ];

  static GoRouter getRouter({required AppBloc appBloc}) {
    return GoRouter(
      refreshListenable: appBloc,
      redirect: (context, state) {
        final authStatus = appBloc.state.authStatus;
        if (authStatus == AuthStatus.unauthenticated &&
            !_startPagesRoutes.contains(state.subloc)) {
          return '/boarding';
        } else if (authStatus == AuthStatus.authenticated &&
            (_startPagesRoutes.contains(state.subloc) || state.subloc == '/')) {
          return '/home';
        }
        return null;
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'loader',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const LoaderPageWidget(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 270),
          ),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (_) => HomePageCubit(),
              child: const HomePageWidget(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 270),
          ),
        ),
        GoRoute(
          path: '/boarding',
          name: 'boarding',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (_) => BoardingPageCubit(),
              child: const BoardingPageWidget(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 270),
          ),
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (_) => SignUpPageCubit(
                authenticationRepository:
                    context.read<AuthenticationRepository>(),
              ),
              child: const SignUpPageWidget(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          name: 'login',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (_) => LogInPageCubit(
                  authenticationRepository: AuthenticationRepository()),
              child: const LogInPageWidget(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          routes: [
            GoRoute(
              path: 'forgot-password',
              name: 'forgot_password',
              pageBuilder: (context, state) => CustomTransitionPage(
                child: BlocProvider(
                  create: (_) => ForgotPasswordPageCubit(
                    authenticationRepository:
                        context.read<AuthenticationRepository>(),
                  ),
                  child: const ForgotPasswordPageWidget(),
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
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
              routes: [
                GoRoute(
                  path: 'confirm-email-code',
                  name: 'confirm_email_code',
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: BlocProvider(
                      create: (_) => ConfirmEmailCodePageCubit(
                        authenticationRepository:
                            context.read<AuthenticationRepository>(),
                        email: state.extra as String,
                      ),
                      child: const ConfirmEmailCodePageWidget(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                          begin: const Offset(1.0, 0.0), end: Offset.zero);
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
                  path: 'new-password',
                  name: 'new_password',
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: BlocProvider(
                      create: (_) => NewPasswordPageCubit(
                        authenticationRepository:
                            context.read<AuthenticationRepository>(),
                      ),
                      child: const NewPasswordPageWidget(),
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                          begin: const Offset(1.0, 0.0), end: Offset.zero);
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
            ),
          ],
        ),
      ],
    );
  }
}
