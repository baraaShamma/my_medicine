

import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class PharmaceuticalData {

  Crud crud ;

  PharmaceuticalData(this.crud) ;

  getData(idActiveSubstances) async {
    var response = await crud.postData(AppLink.pharmaceutical, {"idActiveSubstances":idActiveSubstances.toString()});  ;

    return response.fold((l) => l, (r) => r) ;
  }


}