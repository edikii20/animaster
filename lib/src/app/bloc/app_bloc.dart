import 'dart:async';
import 'package:aniquiz/src/domain/repositories/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> with ChangeNotifier {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User?> _userSubscription;

  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AppState(authStatus: AuthStatus.loading)) {
    on<AppEvent>((event, emit) async {
      if (event is AppUserChangedEvent) {
        await _onUserChanged(event, emit);
      } else if (event is AppLogoutEvent) {
        _onLogout(event, emit);
      }
    });

    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChangedEvent(user: user)),
    );
  }

  Future<void> _onUserChanged(
      AppUserChangedEvent event, Emitter<AppState> emit) async {
    await event.user?.reload();
    // await Future.delayed(const Duration(seconds: 2));
    if (event.user != null && event.user?.emailVerified == true) {
      emit(
        state.copyWith(authStatus: AuthStatus.authenticated),
      );
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }

    notifyListeners();
  }

  //TODO: Наверное нужно будет убрать из app_bloc и сделать там где будет кнопка выхода из аккаунта
  void _onLogout(AppLogoutEvent event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
