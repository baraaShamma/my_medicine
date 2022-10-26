import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class VerifyCodeResetPasswordData {
  Crud crud;
  VerifyCodeResetPasswordData(this.crud);

  postData(String email, String verifyCode) async {

    var response = await crud.postData(AppLink.verifyCodeResetPassword, {
      "email": email,
      "verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
