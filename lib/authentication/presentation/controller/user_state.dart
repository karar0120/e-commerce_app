import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';

class UserState extends Equatable{

  final RequestState userRequestState;
  final String message;

  const UserState({
    this.userRequestState=RequestState.loading,
    this.message=''});

  @override
  List<Object?> get props => [
    userRequestState,
    message,
  ];

}