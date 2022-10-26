import 'package:get/get.dart';
import 'package:my_medicine/core/services/services.dart';

translationDatabase(columnAr,columnEn){
  MyServices myServices=Get.find();
  if(myServices.sharedPreferences.getString("lang")=="ar")
  {
    return columnEn;

  }
  else
  {
    return columnAr;
  }
}