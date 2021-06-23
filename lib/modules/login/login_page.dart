import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: size.height * 0.36,
              width: size.width,
            ),
            Positioned(
              top: size.height * 0.07,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: size.height * 0.35,
                height: size.width * 0.90,
              ),
            ),
            Positioned(
              top: size.height * 0.07,
              left: 0,
              right: 0,
              child: Container(),
            ),
            Positioned(
              bottom: size.height * 0.10,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 10),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: AppTextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SocialLoginButton(
                      onTap: () {
                        print("Clicou no botão");
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
