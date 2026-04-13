import '3-util.dart';
import 'dart:convert';

Future<String> greetUser() async {
  try {
    String data = await fetchUserData();
    Map json = jsonDecode(data);
    String username = json['username'].toString();
    return 'Hello $username';
  } catch (error) {
    return 'error caught: $error';
  }
}

Future<String> loginUser() async {
  try {
    bool res = await checkCredentials();
    if (res) {
      print('There is a user: true');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (error) {
   return 'error caught: $error';
  }
}