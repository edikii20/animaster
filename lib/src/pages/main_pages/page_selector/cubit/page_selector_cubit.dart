import 'package:bloc/bloc.dart';

part 'page_selector_state.dart';

class PageSelectorCubit extends Cubit<PageSelectorState> {
  PageSelectorCubit() : super(PageSelectorState(selectedIndex: 0));

  void onTapBottomNavBarItem({required int index}) {
    if (index == state.selectedIndex) return;

    emit(state.copyWith(selectedIndex: index));
  }
}
