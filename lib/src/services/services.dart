import 'package:http/http.dart' as http;
import '../models/user.dart';

class Services{
  static final String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User>> getUsers() async{
    List<User> list;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      list = usersFromJson(response.body);
      if (list == null) {
        return <User>[];
      }  else{
        return list;
      }
    }  else{
      return <User>[];
    }

  }
}