
import '../../domain/entities/profile.dart';

class ProfileModel extends Profile{
  const ProfileModel({
    required super.id,
    required super.email,
    required super.name,
    required super.address,
    required super.phone,
    required super.username,
    required super.password});


  factory ProfileModel.fromJson(Map<String,dynamic>json){
    return ProfileModel(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        phone: json['phone'],
        email: json['email'],
        address: AddressModel.fromJson(json['address'],),
        name: NameModel.fromJson(json['name']),
    );
  }

}

class NameModel extends Name {
  const NameModel({
    required super.firstname,
    required super.lastname});

 factory NameModel.fromJson(Map<String, dynamic> json) {
   return NameModel(
       firstname: json['firstname'],
      lastname : json['lastname'],
    );
  }


}

class AddressModel extends Address {
  const AddressModel({
    required super.zipcode,
    required super.number,
    required super.street,
    required super.city,
    required super.geolocation
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      zipcode: json['zipcode'],
      number : json['number'],
      street: json['street'],
      city : json['city'],
      geolocation:GeolocationModel.fromJson(json['geolocation'],)
    );
  }


}

class GeolocationModel extends Geolocation {
  const GeolocationModel({
    required super.long,
    required super.lat});

  factory GeolocationModel.fromJson(Map<String, dynamic> json) {
    return GeolocationModel(
      long: json['long'],
      lat: json['lat'],
    );
  }
}


