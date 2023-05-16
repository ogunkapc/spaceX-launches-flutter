import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> get() async {
    http.Response response;
    try {
      var url = Uri.parse("https://api.spacexdata.com/v5/launches");
      response = await http.get(url);

      if (response.statusCode == 200) {
        //! API call successful
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        //! API call failed
        print("unable to make request. status: ${response.statusCode}");
        throw Exception(
          "unable to make request. status: ${response.statusCode}",
        );
      }
    } catch (e) {
      //! Exception thrown
      print(e.runtimeType);
      throw Exception(e);
    }
  }
}
