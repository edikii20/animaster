part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppLogoutEvent extends AppEvent {
  const AppLogoutEvent();
}

class AppUserChangedEvent extends AppEvent {
  const AppUserChangedEvent({required this.user});

  final User? user;
}
