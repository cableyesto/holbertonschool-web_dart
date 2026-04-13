import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  final url = Uri.parse('https://rickandmortyapi.com/api/character');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map usersData = jsonDecode(response.body);
      List results = usersData['results'];

      for (var character in results) {
        print(character['name']);
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('error caught: $e');
  }
}