import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.7,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(children: [
          Expanded(flex: 2, child: Image.asset(AppImages.google)),
          Container(
            height: size.height * 0.07,
            width: 1,
            color: AppColors.stroke,
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                'Entrar com Google',
                style: AppTextStyles.buttonGray,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
