part of 'contacts_bloc.dart';

class ContactsState extends Equatable {
  const ContactsState({
    this.isLoading = true,
    this.isFailed = false,
    this.success = true,
  });
  final bool isLoading;
  final bool isFailed;
  final bool success;
  ContactsState copyWith({
    bool? isLoading,
    bool? isFailed,
    bool? success
  }) {
    return ContactsState(
        isLoading: isLoading ?? this.isLoading,
        isFailed: isFailed ?? this.isFailed,
        success: success ?? this.success
    );
  }
  @override
  List<Object> get props => [isLoading, isFailed, success];

}
