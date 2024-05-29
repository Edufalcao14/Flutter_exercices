import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/models/city.dart';

class CityWidget extends StatelessWidget {
  final City city;

  const CityWidget({
    Key? key,
    required this.city
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city.name,
          style: TextStyle(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${city.country}, ${city.state}',
              style: TextStyle(color: Colors.grey),
            ),
             TextButton(
              onPressed: () => context.go('/cart' , extra: city), child:Icon(Icons.wb_cloudy_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
