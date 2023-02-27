part of 'page_selector_cubit.dart';

class PageSelectorState {
  final int selectedIndex;
  PageSelectorState({
    required this.selectedIndex,
  });

  PageSelectorState copyWith({
    int? selectedIndex,
  }) {
    return PageSelectorState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(covariant PageSelectorState other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}
