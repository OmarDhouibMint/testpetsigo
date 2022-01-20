part of 'chatbots_bloc.dart';


class ChatbotsState extends Equatable {
  const ChatbotsState({
    this.isLoading = true,
    this.isFailed = false,
    this.success = FormzStatus.pure,
    this.index = 1,

  });
  final bool isLoading;
  final bool isFailed;
  final FormzStatus success;
  final int index;

  ChatbotsState copyWith({
    bool? isLoading,
    bool? isFailed,
    FormzStatus? success,
    int? index
  }) {
    return ChatbotsState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      success: success ?? this.success,
      index: index ?? this.index
    );
  }
  @override
  List<Object> get props => [isLoading, isFailed, success, index];

}

