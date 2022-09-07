//  {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     }

class Address {
  final String street, suite, city, zipcode;
  final Geo geo;
  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  static Address convertToAddress(Map json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.convertFromJson(json['geo']),
    );
  }
}

//
//       { "lat": "-37.3159",
//         "lng": "81.1496"
//       }
class Geo {
  final String latitude, longitude;

  Geo({required this.latitude, required this.longitude});

  static Geo convertFromJson(Map json) {
    return Geo(latitude: json['lat'], longitude: json['long']);
  }
}
