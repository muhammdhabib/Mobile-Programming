import 'package:flutter/material.dart';
import 'package:medicalapp/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherController {
  final String apiKey = "ed68bcc8f3a5b3b23dd2da5b04f3215e";
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel> getWeatherByCity(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weatherMain = data['weather'][0]['main'];

      IconData weatherIcon;
      switch (weatherMain) {
        case 'Clear':
          weatherIcon = Icons.wb_sunny;
          break;
        case 'Clouds':
          weatherIcon = Icons.cloud;
          break;
        case 'Rain':
        case 'Drizzle':
          weatherIcon = Icons.wb_cloudy;
          break;
        case 'Mist':
        case 'Fog':
        case 'Haze':
          weatherIcon = Icons.cloud_queue;
          break;
        default:
          weatherIcon = Icons.nightlight_round;
          break;
      }

      final weatherModel = WeatherModel(
        city: data['name'],
        weatherIcon: weatherIcon,
        temperature: data['main']['temp'],
        weatherCondition: data['weather'][0]['description'],
      );

      return weatherModel;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
