import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/utils/extensions/to_celcius_extension.dart';

import '../../../cubits/weather/weather_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherCubit weatherCubit = context.read<WeatherCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherInitial || state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherNetworkError) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 32),
                  );
                } else if (state is WeatherFailure) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 32),
                  );
                } else if (state is WeatherSuccess) {
                  final temp = state.response.main?.temp;
                  return Text(
                    temp.toCelcius.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 32),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            const SizedBox(height: 24),
            TextField(controller: weatherCubit.weatherController),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => weatherCubit.getWeatherInfo(),
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
