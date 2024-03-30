part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  WeatherSuccess({required this.response});

  final WeatherResponse response;
}

final class WeatherFailure extends WeatherState {
  WeatherFailure({required this.errorMessage});

  final String errorMessage;
}

final class WeatherNetworkError extends WeatherState {
  WeatherNetworkError({required this.errorMessage});

  final String errorMessage;
}

final class WeatherNoData extends WeatherState {}
