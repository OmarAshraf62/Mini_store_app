
import 'package:fake_store_app/helpers/api_helper.dart';
import 'package:fake_store_app/models/user_model.dart';

class UserService {
  static Future<List<UserModel>> getAllUsers() async {
    List usersList =await  Api.get(target: 'users');
    List<UserModel> users = [];
    for (var user in usersList) {
      users.add(UserModel.fromJson(user));
    }
    return users;
  }

  // static Future<List<UserModel>> getAllUsers() async {
  //   //https://api.escuelajs.co/api/v1/users
  //   Uri uri = Uri.https(
  //     BASE_URL,
  //     'api/v1/users',
  //   );
  //   http.Response response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     List usersList = jsonDecode(response.body);
  //     List<UserModel> users = [];
  //     for (var user in usersList) {
  //       users.add(UserModel.fromJson(user));
  //     }
  //     return users;
  //   } else {
  //     throw Exception('404 error ${response.statusCode}');
  //   }
  // }
}
