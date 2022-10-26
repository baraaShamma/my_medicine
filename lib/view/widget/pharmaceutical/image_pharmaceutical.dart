import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_medicine/link_api.dart';
import 'package:my_medicine/logic/controller/pharmaceutical_controller.dart';
class ImagePharmaceutical extends GetView<PharmaceuticalControllerImp> {
  const ImagePharmaceutical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.4,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
        "${AppLink.imagesActiveSubstances}/${controller.imageActiveSubstances}",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        placeholder: (context, url) =>
            CircularProgressIndicator(),
        errorWidget: (context, url, error) => Container(
          width: 100,
          height: 100,
          child: Icon(Icons.image_not_supported, size: 50),
        ),
      ),
    );
  }
}
