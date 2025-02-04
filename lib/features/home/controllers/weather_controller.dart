import 'package:disaster_shield_bd/features/user_information/controllers/user_controller.dart';
import 'package:disaster_shield_bd/utils/constants/openweather_api_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather/weather.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();

  final WeatherFactory weatherFactory = WeatherFactory(OPEN_WEATHER_API_KEY);
  var weather = Rxn<Weather>();
  final localStorage = GetStorage();


  @override
  void onInit() {
    super.onInit();
    fetchWeatherData(localStorage.read("USER_DISTRICT") ?? "Sylhet");
  }

  Future<void> fetchWeatherData(String userDistrict) async{

    if (userDistrict == null || userDistrict.isEmpty) {
      print("City name is null or empty. Cannot fetch weather data.");
      return;
    }

    try {
      weather = Rxn<Weather>(await weatherFactory.currentWeatherByCityName(userDistrict));
      print("Weather data: ${weather.toString()}");
    } catch (e) {
      print("Error fetching weather data: $e");
    }
  }
}
