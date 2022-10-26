

import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class HomeData {

  Crud crud ;

  HomeData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});  ;

    return response.fold((l) => l, (r) => r) ;
  }


}