import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'New York, USA',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              '22°',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Partly Cloudy',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.cloud, color: Colors.white, size: 80),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white30),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        _buildWeatherStat('High', '25°'),
                        _buildWeatherStat('Low', '18°'),
                        _buildWeatherStat('Rain', '20%'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: _buildGridCard(
                      Icons.air,
                      Colors.blue,
                      'Wind',
                      '12 km/h',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGridCard(
                      Icons.water_drop,
                      Colors.cyan,
                      'Humidity',
                      '65%',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildGridCard(
                      Icons.visibility,
                      Colors.purple,
                      'Visibility',
                      '10 km',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGridCard(
                      Icons.speed,
                      Colors.orange,
                      'Pressure',
                      '1013 mb',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                '7-Day Forecast',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ForecastRow(
                      day: 'Mon',
                      icon: Icons.wb_sunny_outlined,
                      high: '25°',
                      low: '18°',
                    ),
                    const SizedBox(height: 16),
                    ForecastRow(
                      day: 'Tue',
                      icon: Icons.wb_sunny_outlined,
                      high: '26°',
                      low: '19°',
                    ),
                    const SizedBox(height: 16),
                    ForecastRow(
                      day: 'Wed',
                      icon: Icons.cloud_outlined,
                      high: '24°',
                      low: '17°',
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

  Widget _buildWeatherStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildGridCard(
    IconData icon,
    Color color,
    String label,
    String value,
  ) {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: .circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: .all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
