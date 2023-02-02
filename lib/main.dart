import 'package:aniquiz/firebase_options.dart';
import 'package:aniquiz/src/app/bloc/app_bloc.dart';
import 'package:aniquiz/src/domain/db/cloud_firestore_db/cloud_firestore_manager.dart';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app/app.dart';

void main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();

  final authenticationRepository = AuthenticationRepository();

  //await authenticationRepository.user.first;

  runApp(
    RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: const App(),
      ),
    ),
  );
}
