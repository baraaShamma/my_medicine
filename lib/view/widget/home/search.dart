import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/core/class/handling_data_view.dart';
import 'package:my_medicine/logic/controller/search_controller.dart';

class DataSearch extends SearchDelegate<String> {
  // List<dynamic>? list;
  // DataSearch({this.list});
  List<dynamic> list = [
    {"name": "mike", "age": "20"},
    {"name": "mikke", "age": "20"}
  ];

  var ii;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: Icon(Icons.arrow_back));
  }

//  Map<dynamic, dynamic> my_List = [{"name": "mike", "age": "20"}, {"name": "william", "age": "23"}] as Map;

  @override
  Widget buildSuggestions(BuildContext context) {
    SearchControllerImp controller = Get.put(SearchControllerImp());

    var searchList = query.isEmpty
        ? controller.activeSubstancesNameEn
        : controller.activeSubstancesNameEn
            .where((p) => p.startsWith(query))
            .toList();
    return GetBuilder<SearchControllerImp>(
        builder: (_) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.panorama_fish_eye),
                    title: Text(searchList[index]),
                    onTap: () {
                      controller.goToMedicines(
                          controller.activeSubstances[index]["active_substances_id"],
                          controller.activeSubstances[index]["active_substances_image"]);
                      //     showResults(context);
                    },
                  );
                })));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
