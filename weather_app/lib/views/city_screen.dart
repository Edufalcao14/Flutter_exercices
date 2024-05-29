import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/views/city_widget.dart';
import '../models/city.dart';


class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  List<City> cities = [];

  @override
  void initState() {
    City.getAllEuropeanCapitals().then(
          (value) => setState(() => cities.addAll(value)),
      onError: (error) => log(error),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('European Capitals'),

      ),
      body: ListView.separated(
        itemCount: cities.length,
        separatorBuilder: (context, index) => Divider(color: Colors.white),
        itemBuilder: (context, index) {
          return CityWidget(
            city: cities[index],
          );
        },
      ),
    );
  }
}
