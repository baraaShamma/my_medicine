import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class ActiveSubstancesData {
  Crud crud;

  ActiveSubstancesData(this.crud);

  getData(id) async {
    var response =
    await crud.postData(AppLink.activeSubstances, {"idDiseases": id.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
