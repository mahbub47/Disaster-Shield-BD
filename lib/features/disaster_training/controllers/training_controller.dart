import 'package:disaster_shield_bd/features/authentication/controllers/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/training_model.dart';

class DisasterController extends GetxController {
  RxList<TrainingModel> disasters = <TrainingModel>[].obs;
  var isLoading = true.obs;

  final String url = "https://api.jsonbin.io/v3/b/679d2af2acd3cb34a8d62922";

  @override
  void onInit() {
    fetchDisasters();
    super.onInit();
  }

  Future<void> fetchDisasters() async {
    try {
      // print("Disasters fetched: ${disasters.length}");
      isLoading(true);
      final response = await http.get(Uri.parse(url));
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        disasters.value = (data['record']['disasters'] as List)
            .map((e) => TrainingModel.fromJson(e))
            .toList();
        print("Disasters fetched: ${disasters.length}");
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
