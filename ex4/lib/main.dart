import 'package:flutter/material.dart';

enum WeatherType {
  cloudy('cloudy.png'),
  sunny('sunny.png'),
  sunnyCloudy('sunnyCloudy.png'),
  veryCloudy('very cloudy.png'),
  rainy('rainny.png');

  final String imagePath;
  const WeatherType(this.imagePath);
}

class LocationWeather {
  final String location;
  final String country;
  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final WeatherType weather;
  final List<Color> gradientColors;
  final String backgroundImage;

  const LocationWeather({
    required this.location,
    required this.country,
    required this.currentTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weather,
    required this.gradientColors,
    required this.backgroundImage,
  });
}

void main() {
  const List<LocationWeather> locations = [
    LocationWeather(
      location: 'Marina Bay Sands',
      country: 'Singapore',
      currentTemp: 32.5,
      minTemp: 26.0,
      maxTemp: 34.0,
      weather: WeatherType.sunny,
      gradientColors: [Color(0xFFFF8008), Color(0xFFFFC837)],
      backgroundImage: 'singapore.jpg',
    ),
    LocationWeather(
      location: 'Petronas Twin Towers',
      country: 'Kuala Lumpur, Malaysia',
      currentTemp: 29.8,
      minTemp: 24.0,
      maxTemp: 32.0,
      weather: WeatherType.sunnyCloudy,
      gradientColors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
      backgroundImage: 'malay.JPG',
    ),
    LocationWeather(
      location: 'Phnom Penh',
      country: 'Cambodia',
      currentTemp: 31.0,
      minTemp: 25.0,
      maxTemp: 33.5,
      weather: WeatherType.cloudy,
      gradientColors: [Color(0xFF7F7FD5), Color(0xFF86A8E7)],
      backgroundImage: 'phnompenh.jpg',
    ),
    LocationWeather(
      location: 'Zurich',
      country: 'Switzerland',
      currentTemp: 11.4,
      minTemp: 6.0,
      maxTemp: 14.0,
      weather: WeatherType.veryCloudy,
      gradientColors: [Color(0xFF3A6073), Color(0xFF16222A)],
      backgroundImage: 'zurich.jpg',
    ),
    LocationWeather(
      location: 'Big Ben',
      country: 'London, United Kingdom',
      currentTemp: 14.5,
      minTemp: 9.0,
      maxTemp: 16.0,
      weather: WeatherType.rainy,
      gradientColors: [Color(0xFF283E51), Color(0xFF4B79A1)],
      backgroundImage: 'bigben.jpg',
    ),
  ];

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF81D4FA),
          title: const Text(
            'My Travel Weather',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.menu, color: Colors.white),
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return WeatherCard(data: locations[index]);
          },
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final LocationWeather data;

  const WeatherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 6,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 115,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: data.gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
child: Stack(
          children: [
            // Layer 1 (Bottom): Location photo filling the card
            Positioned.fill(
              child: Image.asset(
                data.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            // Layer 2: Semi-transparent gradient overlay so text stays readable
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      data.gradientColors[0].withValues(alpha: 0.75),
                      data.gradientColors[1].withValues(alpha: 0.75),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            // Layer 3: Decorative translucent oval on the right side
            Positioned(
              right: -40,
              top: -20,
              bottom: -20,
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // Layer 4 (Top): Your existing Padding + Row content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                // ... keep your exact existing Row code here
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        data.weather.imagePath,
                        width: 34,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.location,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.country,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Min ${data.minTemp.toStringAsFixed(1)}°C  •  Max ${data.maxTemp.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${data.currentTemp.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}