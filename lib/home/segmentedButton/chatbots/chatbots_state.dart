part of 'chatbots_bloc.dart';


class ChatbotsState extends Equatable {
  const ChatbotsState({
    this.isLoading = true,
    this.isFailed = false,
    this.success = true,
  });
  final bool isLoading;
  final bool isFailed;
  final bool success;
  ChatbotsState copyWith({
    bool? isLoading,
    bool? isFailed,
    bool? success
  }) {
    return ChatbotsState(
      isLoading: isLoading ?? this.isLoading,
      isFailed: isFailed ?? this.isFailed,
      success: success ?? this.success
    );
  }
  @override
  List<Object> get props => [isLoading, isFailed, success];

}

