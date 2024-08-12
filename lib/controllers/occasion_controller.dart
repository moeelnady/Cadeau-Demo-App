import 'dart:convert';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> receivedOccasionsList = [];

class OccasionController {
  void getOccasionTypes() async {
    final response = await http.get(
      Uri.parse(
          'https://apistaging.cadeau.com.sa/api/v1/lookups/occasion_types'),
    );
    print('occasions response : ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final dynamicList = data['data']['occasion_types'];
      receivedOccasionsList = convertToListOfStringMaps(dynamicList);
    }
  }

  List<Map<String, String>> convertToListOfStringMaps(dynamic data) {
    if (data is List) {
      return data.cast<Map<String, dynamic>>().map((item) {
        return item.map((key, value) {
          return MapEntry(key.toString(), value.toString());
        });
      }).toList();
    } else {
      throw ArgumentError('Data is not a list of maps');
    }
  }

}
