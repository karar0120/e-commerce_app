import 'package:equatable/equatable.dart';

class  Profile extends Equatable  {
  final int id;
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;
  const Profile(
      {  required this.id,
         required this.email,
         required this.username,
         required this.password,
         required this.name,
         required this.address,
         required this.phone});

  @override
  List<Object?> get props => [
    id,
    email,
    username,
    password,
    name,
    address,
    phone,
  ];


}

class Name extends Equatable{
  final String firstname;
  final String lastname;
  const Name({required this.firstname, required this.lastname});

  @override
  List<Object?> get props =>[
    firstname,
    lastname,
  ];
}

class Address extends Equatable{
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final Geolocation geolocation;
  const Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  @override
  List<Object?> get props =>[
    city,
    street,
    number,
    zipcode,
    geolocation,
  ];
}
class Geolocation extends Equatable{
  final String lat;
  final String long;
  const Geolocation({required this.lat, required this.long});

  @override
  List<Object?> get props =>[
    lat,
    long,
  ];
}
