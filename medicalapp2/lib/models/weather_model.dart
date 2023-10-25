import 'package:flutter/material.dart';

class WeatherModel {
  final String city;
  final IconData weatherIcon;
  final double temperature;
  final String weatherCondition;

  WeatherModel({
    required this.city,
    required this.weatherIcon,
    required this.temperature,
    required this.weatherCondition,
  });
}
