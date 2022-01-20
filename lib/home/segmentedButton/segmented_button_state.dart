part of 'segmented_button_bloc.dart';

class SegmentedButtonState extends Equatable {
  const SegmentedButtonState({
    this.isLoading = true,
    this.isFailed = false,
    this.success = FormzStatus.pure,
    this.index = 0,
  });
  final bool isLoading;
  final bool isFailed;
  final FormzStatus success;
  final int index;
  SegmentedButtonState copyWith({
    bool? isLoading, bool? isFailed, FormzStatus? success, int? index
  }) {
    return SegmentedButtonState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
        success: success ?? this.success,
        index: index ?? this.index);
  }

  @override
  List<Object> get props => [isLoading, isFailed, success, index];
}
