part of 'boarding_page_cubit.dart';

class BoardingPageState {
  final int selectedIndex;
  BoardingPageState({
    required this.selectedIndex,
  });

  BoardingPageState copyWith({
    int? selectedIndex,
  }) {
    return BoardingPageState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(covariant BoardingPageState other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}
