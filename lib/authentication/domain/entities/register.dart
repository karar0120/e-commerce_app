import 'package:equatable/equatable.dart';

class Register extends Equatable{
  final int id;
  const Register({required this.id});

  @override
  List<Object?> get props =>[
    id,
  ];
}