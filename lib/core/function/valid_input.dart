import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "42".tr;
  }
  if(val.isNotEmpty)
    {
      if (type == "username") {
        if (!GetUtils.isUsername(val)) {
          return "39".tr;
        }
      }
      if (type == "email") {
        if (!GetUtils.isEmail(val)) {
          return "40".tr;
        }
      }

      if (type == "phone") {
        if (!GetUtils.isPhoneNumber(val)) {
          return "41".tr;
        }
      }


      if (val.length < min) {
        return "${"43".tr}$min";
      }

      if (val.length > max) {
        return "${"44".tr} $max";
      }
    }


}