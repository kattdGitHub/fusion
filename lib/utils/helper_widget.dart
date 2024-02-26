import 'package:flutter/material.dart';
import 'package:fusion/Theme/theme.dart';

import '../business_logic/local_storage.dart';

LocalStorage get localStorage => LocalStorage();

Widget get getCustomLoading => Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    );
