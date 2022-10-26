import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email
    });
    return response.fold((l) => l, (r) => r);
  }
}
