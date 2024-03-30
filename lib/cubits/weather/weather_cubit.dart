import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_response.dart';
import 'package:weather_app/data/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final weatherController = TextEditingController(text: 'baku');

  WeatherResponse? result;

  void getWeatherInfo() async {
    try {
      emit(WeatherLoading());
      result = await WeatherService.getWeatherInfo(weatherController.text);
      emit(WeatherSuccess(response: result!));
    } on SocketException catch (e) {
      log('SocketException: $e');
      emit(WeatherNetworkError(errorMessage: 'No Internet'));
    } catch (e) {
      log('catch: $e');
      emit(WeatherFailure(errorMessage: 'Error Occured'));
    }
  }

  @override
  Future<void> close() {
    weatherController.dispose();
    return super.close();
  }
}
