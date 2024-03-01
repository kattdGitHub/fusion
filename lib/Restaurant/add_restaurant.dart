
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/providers/restaurants_provider.dart';
import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

class AddRestaurant extends StatelessWidget {
  AddRestaurant({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      title: Text(
        "Restaurant",
        style: TextStyle(
          fontFamily: "Jost",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff000000),
          height: 29 / 20,
        ),
        textAlign: TextAlign.left,
      ),
    ),
      body: Form(
        key: formKey,
        child: Consumer<RestaurantsProvider>(builder: (context, provider, child) {
          return Scaffold(

            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Name of the Restaurant",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: AppValidator.nameValidator,
                          controller: provider.nameController,
                          decoration: InputDecoration(
                            hintText: 'name',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Location",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: provider.locationController,
                          decoration: InputDecoration(
                            hintText: 'Location',
                            suffixIcon: Icon(Icons.location_on_outlined),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) => AppValidator.customValidator(
                            value: value,
                            massage: "Phone Number",
                          ),
                          controller: provider.phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Website",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: provider.websiteController,
                          decoration: InputDecoration(
                            hintText: 'Website',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Add Cuisines ",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DropdownSearch<String>.multiSelection(
                          items: [
                            "Brazil",
                            "Italia (Disabled)",
                            "Tunisia" "Brazil",
                            "Italia (Disabled)",
                            "Tunisia",
                            'Canada'
                          ],
                          popupProps: PopupPropsMultiSelection.menu(
                            showSelectedItems: true,
                          ),
                          onChanged: print,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Business Hours",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => provider.selectTime(
                                  context,
                                  controller: provider.openTimeController,
                                ),
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: TextFormField(
                                   /* validator: (value) =>
                                        AppValidator.customValidator(
                                            value: value, massage: "Open Time",),
                                            .+*/
                                    controller: provider.openTimeController,
                                    style: TextStyle(
                                      fontFamily: "Open Time",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff979797),
                                      height: 16 / 12,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Open Time',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () => provider.selectTime(
                                  context,
                                  controller: provider.closeTimeController,
                                ),
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: TextFormField(
                                    /*validator: (value) =>
                                        AppValidator.customValidator(
                                      value: value,
                                      massage: "Close Time",
                                    ),*/
                                    controller: provider.closeTimeController,
                                    style: TextStyle(
                                      fontFamily: "Close Time",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff979797),
                                      height: 16 / 12,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: 'Close Time',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) => AppValidator.customValidator(
                              value: value, massage: "Description"),
                          controller: provider.descriptionController,
                          maxLines: 7,
                          decoration: InputDecoration(
                            enabled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Add Restaurant Images/Video",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
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
                          padding: EdgeInsets.all(8.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            padding: EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
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
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.image),
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Document and Verification",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff777777),
                            height: 17 / 12,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => provider.pickDoc(),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(12),
                            padding: EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (provider.docFile != null)
                                      Icon(
                                        Icons.done_all,
                                        color: Colors.green,
                                        size: 50.h,
                                      ),
                                    if (provider.docFile == null)
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Image(
                                          image: AssetImage(
                                            "assets/image/file .png",
                                          ),
                                        ),
                                      ),
                                    if (provider.docFile == null)
                                      Text(
                                        "Upload Document",
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
                                height: 200,
                                width: AppConfig.width,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(8.0),
              child: AppBtn(
                isLoading: provider.restarurantLoading,
                title: "Save",
                style: TextStyle(
                  fontFamily: "Jost",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  height: 26 / 18,
                ),
                onPressed: () {
                  if (formKey.currentState?.validate() == false) return;
                  provider.saveRestaurantDetails(context);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
