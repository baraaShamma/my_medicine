import 'package:my_medicine/core/class/crud.dart';
import 'package:my_medicine/link_api.dart';

class SearchData {
  Crud crud;

  SearchData(this.crud);

  getData() async {
    var response =
    await crud.postData(AppLink.search, {});

    return response.fold((l) => l, (r) => r);
  }
}
