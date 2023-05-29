import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.id,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'],
    );
  }
}