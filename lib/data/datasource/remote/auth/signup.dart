import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
