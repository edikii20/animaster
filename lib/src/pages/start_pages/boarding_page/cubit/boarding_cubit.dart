import 'package:bloc/bloc.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingState(selectedIndex: 0));

  void onTipsChanged({required int index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}
