part of 'boarding_cubit.dart';

class BoardingState {
  final int selectedIndex;
  BoardingState({
    required this.selectedIndex,
  });

  BoardingState copyWith({
    int? selectedIndex,
  }) {
    return BoardingState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(covariant BoardingState other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}
