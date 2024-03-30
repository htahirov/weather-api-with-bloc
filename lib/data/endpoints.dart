class Endpoints {
  Endpoints._();

  static String weatherUrl(String city) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=673a8483d6c78b8387fe7388a2beb4a0';

  // static const login = '$_weatherUrl/login';
  // static const register = '$_weatherUrl/register';
}
