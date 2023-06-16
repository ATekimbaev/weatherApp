import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_3/models/weather_model.dart';
import 'package:intl/intl.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    final formatter = DateFormat('MMMM dd, yyyy');
    final formattedDate = formatter.format(currentDate);
    List<WeatherModel> data = [
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun1.png', temp: '10'),
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: getColor(currentDate.hour),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Text(
                'San Francisco',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text(
                'Clear',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 33),
              Image.asset(
                'assets/sun1.png',
                height: 100,
              ),
              const SizedBox(height: 12),
              Text(
                formattedDate,
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => WeatherWidget(
                    model: data[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> getColor(int currentHour) {
    List<Color> colors = [
      Color(0xff223076),
      Color(0xff06050E),
    ];
    print(currentHour);

    if (currentHour >= 19 && currentHour < 23) {
      colors = [];
      colors.addAll(
        [
          Color(0xff4BB5F1),
          Color(0xff2F2CBC),
        ],
      );
    }

    return colors;
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key, required this.model});

  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.day,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Image.asset(
            model.image,
            width: 25,
          ),
          Text(
            model.temp,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
