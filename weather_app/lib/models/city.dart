import 'dart:convert';
import 'package:http/http.dart' as http;

class City {
  static List<String> capitals = [
  'Amsterdam', // Netherlands
  'Andorra la Vella', // Andorra
  'Athens', // Greece
  'Belgrade', // Serbia
  'Berlin', // Germany
  'Bratislava', // Slovakia
  'Brussels', // Belgium
  'Bucharest', // Romania
  'Budapest', // Hungary
  'Chisinau', // Moldova
  'Vatican City', // Vatican City
  'Copenhagen', // Denmark
  'Dublin', // Ireland
  'Stockholm', // Sweden
  'Helsinki', // Finland
  'Kyiv', // Ukraine
  'Ljubljana', // Slovenia
  'London', // United Kingdom
  'Luxembourg', // Luxembourg
  'Madrid', // Spain
  'Minsk', // Belarus
  'Monaco', // Monaco
  'Moscow', // Russia
  'Oslo', // Norway
  'Paris', // France
  'Podgorica', // Montenegro
  'Prague', // Czech Republic
  'Reykjavik', // Iceland
  'Riga', // Latvia
  'Rome', // Italy
  'San Marino', // San Marino
  'Sarajevo', // Bosnia and Herzegovina
  'Skopje', // North Macedonia
  'Sofia', // Bulgaria
  'Tallinn', // Estonia
  'Tirana', // Albania
  'Warsaw', // Poland
  'Vienna', // Austria
  'Vilnius', // Lithuania
  'Zagreb', // Croatia
  ];

  final String name;
  final String country;
  final String state;
  final double lat;
  final double lon;

  City({
    required this.name,
    required this.lon,
    required this.lat,
    required this.country,
    required this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json["name"],
      lon: json["lon"],
      lat: json["lat"],
      country: json["country"],
      state: json["state"],
    );
  }

  static Future<City> fetchCity(String cityName) async {
    var response = await http.get(
      Uri.parse("http://api.openweathermap.org/geo/1.0/direct?q=${cityName}&limit=5&appid=37f098f8a157df2d42d791f5f49874e4"),
    );

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching City");
    }

    final jsonList = jsonDecode(response.body);
    if (jsonList.isEmpty) {
      throw Exception("No city found for $cityName");
    }

    return City.fromJson(jsonList.first);
  }

  static Future<List<City>> getAllEuropeanCapitals() async {// Add more capitals if needed
    List<City> allEuropeanCapitals = [];

    for (String city in capitals) {
      try {
        var cityObject = await fetchCity(city);
        allEuropeanCapitals.add(cityObject);
      } catch (error) {
        print(error);
      }
    }

    return allEuropeanCapitals;
  }

  @override
  String toString() {
    return 'Name: $name, Country: $country, State: $state, lat: $lat, lon: $lon';
  }
}
