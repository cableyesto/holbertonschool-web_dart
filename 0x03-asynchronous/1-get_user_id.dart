import '1-util.dart';
import 'dart:convert';

Future<String> getUserId() async {
  String data = await fetchUserData();
  Map json = jsonDecode(data);
  return json['id'].toString();
}