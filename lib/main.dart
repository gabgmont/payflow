import 'package:flutter/material.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';

void main() {
  runApp(PayFlow());
}

class PayFlow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
    );
  }
}
