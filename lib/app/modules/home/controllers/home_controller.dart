import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:newsapp/app/modules/models/articleclass/result.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  //late List results = [];
  List<Result> articles = [];
  final String baseUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=";
  final String apikey = "9F3Jc8sKvgw1elDDGO0tVqJHZAIJgSnu";
  final count = 0.obs;

  makeOpenLink(String url) {
    // ignore: deprecated_member_use
    if (url != null) {
      // ignore: deprecated_member_use
      launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onInit() {
    print("lenght === ${articles.length}");
    fetchdatas();
    // results = fetchdatas() as List;
    print("${apikey + baseUrl}");
    super.onInit();
  }

  fetchdatas() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=9F3Jc8sKvgw1elDDGO0tVqJHZAIJgSnu"));
      // print(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        final responses = jsonDecode(response.body);
        Iterable list = responses["results"];
        return articles =
            list.map((article) => Result.fromJson(article)).toList();
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
