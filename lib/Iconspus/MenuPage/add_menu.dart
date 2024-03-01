import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fusion/Iconspus/MenuPage/menu.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/business_logic/providers/menu_provider.dart';
import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:fusion/utils/navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddMenu extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddMenu({super.key, required this.model});

  final RestaurantModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Add Menu",
          style: TextStyle(
            fontFamily: "Jost",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
            height: 29 / 20,
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: Form(
        key: formKey,
        child: Consumer<MenuProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Name of the dish",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: provider.nameController,
                      validator: (value) => AppValidator.customValidator(
                          value: value, massage: "Name"),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: provider.quantityController,
                      validator: (value) => AppValidator.customValidator(
                          value: value, massage: "Quantity"),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Price",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: provider.priceController,
                      validator: (value) => AppValidator.customValidator(
                          value: value, massage: "Price"),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: provider.descriptionController,
                      validator: (value) => AppValidator.customValidator(
                          value: value, massage: "Description"),
                      maxLines: 5,
                      decoration: const InputDecoration(
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Your Dish Photo",
                      style: TextStyle(
                        fontFamily: "Jost",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff777777),
                        height: 20 / 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showImageDialog(
                        context,
                        onTapCamera: () =>
                            provider.pickImage(ImageSource.camera),
                        onTapGallery: () =>
                            provider.pickImage(ImageSource.gallery),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              image: provider.pickedImage == null
                                  ? null
                                  : DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(
                                        provider.pickedImage ?? File(""),
                                      ),
                                    ),
                            ),
                            height: 200,
                            width: AppConfig.width,
                            child: provider.pickedImage != null
                                ? null
                                : const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image,
                                        color: Colors.deepOrange,
                                      ),
                                      Text(
                                        "Choose file to upload Image",
                                        style: TextStyle(
                                          fontFamily: "Jost",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff777777),
                                          height: 16 / 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),

                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppBtn(
                      isLoading:provider.menuLoading,
                      title: "Save",
                      style: const TextStyle(
                        fontFamily: "Jost",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 26 / 18,
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) return;
                        // read.saveRestaurantDetails(context);
                        context
                            .read<MenuProvider>()
                            .saveMenuDetails(context: context, restaurantId: model.id);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}
