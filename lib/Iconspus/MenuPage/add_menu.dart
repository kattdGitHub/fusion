import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fusion/app_config/app_config.dart';
import 'package:fusion/business_logic/models/menu_model.dart';
import 'package:fusion/business_logic/models/restaurant_model.dart';
import 'package:fusion/business_logic/providers/menu_provider.dart';
import 'package:fusion/halper/image_helper.dart';
import 'package:fusion/utils/app_btn.dart';
import 'package:fusion/utils/app_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddEditMenuScreen extends StatefulWidget {
  const AddEditMenuScreen({
    super.key,
    required this.model,
    this.menuModel,
  });

  final MenuModel? menuModel;
  final RestaurantModel model;

  @override
  State<AddEditMenuScreen> createState() => _AddEditMenuScreenState();
}

class _AddEditMenuScreenState extends State<AddEditMenuScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.menuModel != null) {
      context.read<MenuProvider>().update(widget.menuModel ?? MenuModel());
    }
    super.initState();
  }

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
                        contentPadding: EdgeInsets.all(20.0),
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
                              image: getDecorationImage(provider),
                            ),
                            height: 200,
                            width: AppConfig.width,
                            child: buildPlaceholderWidget(provider),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppBtn(
                      isLoading: provider.menuLoading,
                      title: widget.menuModel?.id == null ? "Save" : "Update",
                      style: const TextStyle(
                        fontFamily: "Jost",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 26 / 18,
                      ),
                      onPressed: () {
                        if (formKey.currentState?.validate() == false) return;
                        if (widget.menuModel == null) {
                          // read.saveRestaurantDetails(context);
                          context.read<MenuProvider>().saveMenuDetails(
                              context: context, restaurantId: widget.model.id);
                        } else {
                          context.read<MenuProvider>().editMenuDetails(
                              context: context,
                              menuId: widget.menuModel?.id ?? '');
                        }
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

  DecorationImage? getDecorationImage(MenuProvider provider) {
    if (provider.imageController.text.isNotEmpty) {
      return DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
          provider.imageController.text,
        ),
      );
    } else if (provider.pickedImage != null) {
      return DecorationImage(
        fit: BoxFit.fill,
        image: FileImage(
          provider.pickedImage!,
        ),
      );
    } else {
      return null;
    }
  }

  Widget? buildPlaceholderWidget(MenuProvider provider) {
    if (provider.pickedImage != null ||
        provider.imageController.text.isNotEmpty) {
      return null;
    } else {
      return const Column(
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
      );
    }
  }
}
