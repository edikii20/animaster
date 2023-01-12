import 'package:aniquiz/src/pages/start_pages/boarding_page/cubit/boarding_cubit.dart';
import 'package:aniquiz/src/pages/start_pages/boarding_page/ui/boarding_page.dart';
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
            create: (_) => BoardingCubit(),
            child: const BoardingPageWidget(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: Duration.zero,
        ),
      ),
    ],
  );
}
