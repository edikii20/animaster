import 'package:bloc/bloc.dart';

part 'boarding_page_state.dart';

class BoardingPageCubit extends Cubit<BoardingPageState> {
  BoardingPageCubit() : super(BoardingPageState(selectedIndex: 0));

  void onTipsChanged({required int index}) {
    emit(state.copyWith(selectedIndex: index));
  }
}
