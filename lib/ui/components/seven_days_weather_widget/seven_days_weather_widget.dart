import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/provider/weather_provider.dart';
import 'package:weather_app/ui/ui_theme/app_colors.dart';


class SevenDaysWeatherWidget extends StatelessWidget {
  const SevenDaysWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<WeatherProvider>();
    return Container(
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.sevenDayBoxColor,
      ),
    );
  }
}
"moon_phase": 0.64,
      "temp": {
        "day": 269.52,
        "min": 263.3,
        "max": 269.78,
        "night": 267.13,
        "eve": 268.11,
        "morn": 263.3
      },
      "feels_like": {
        "day": 264.29,
        "night": 261.35,
        "eve": 262.35,
        "morn": 259.29
      },
      "pressure": 1032,
      "humidity": 85,
      "dew_point": 267.16,
      "wind_speed": 4.41,
      "wind_deg": 176,
      "wind_gust": 10.8,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": 100,
      "pop": 0,
      "uvi": 0.81
    },
    {
      "dt": 1676106000,
      "sunrise": 1676091859,
      "sunset": 1676125403,
      "moonrise": 0,
      "moonset": 1676097960,
      "moon_phase": 0.67,
      "temp": {
        "day": 267.7,
        "min": 264.21,
        "max": 268.83,
        "night": 265.73,
        "eve": 265.45,
        "morn": 264.81
      },
      "feels_like": {
        "day": 262.02,
        "night": 261.47,
        "eve": 261.74,
        "morn": 258.96
      },
      "pressure": 1024,
      "humidity": 87,
      "dew_point": 265.73,
      "wind_speed": 4.43,
      "wind_deg": 185,
      "wind_gust": 11.2,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": 91,
      "pop": 0,
      "uvi": 1
    },
    {
      "dt": 1676192400,
      "sunrise": 1676178129,
      "sunset": 1676211934,
      "moonrise": 1676149860,
      "moonset": 1676184780,
      "moon_phase": 0.71,
      "temp": {
        "day": 268.48,
        "min": 265.09,
        "max": 269.88,
        "night": 267.88,
        "eve": 268.77,
        "morn": 265.09
      },
      "feels_like": {
        "day": 266.13,
        "night": 263.66,
        "eve": 264.83,
        "morn": 265.09
      },
      "pressure": 1030,
      "humidity": 91,
      "dew_point": 267.12,
      "wind_speed": 2.8,
      "wind_deg": 25,
      "wind_gust": 6.36,
      "weather": [
        {
          "id": 600,
          "main": "Snow",
          "description": "light snow",
          "icon": "13d"
        }
      ],
      "clouds": 98,
      "pop": 0.2,
      "snow": 0.62,
      "uvi": 1
    },
    {
      "dt": 1676278800,
      "sunrise": 1676264398,
      "sunset": 1676298466,
      "moonrise": 1676241360,
      "moonset": 1676271840,
      "moon_phase": 0.75,
      "temp": {
        "day": 265.14,
        "min": 258.35,
        "max": 267.67,
        "night": 258.8,
        "eve": 261.48,
        "morn": 259.8
      },
      "feels_like": {
        "day": 262.01,
        "night": 254.07,
        "eve": 257.53,
        "morn": 255.07
      },
      "pressure": 1043,
      "humidity": 88,
      "dew_point": 263.07,
      "wind_speed": 2.35,
      "wind_deg": 2,
      "wind_gust": 5.88,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": 67,
      "pop": 0,
      "uvi": 1
    }
  ]
}