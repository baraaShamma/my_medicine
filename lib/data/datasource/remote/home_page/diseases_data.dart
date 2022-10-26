import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class DiseasesData {
  Crud crud;

  DiseasesData(this.crud);

  getData(id) async {
    var response =
        await crud.postData(AppLink.diseases, {"idCategories": id.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
