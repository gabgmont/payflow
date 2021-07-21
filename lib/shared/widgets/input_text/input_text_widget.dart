import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final bool numericKeyboard;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
    this.numericKeyboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              keyboardType: numericKeyboard ? TextInputType.numberWithOptions() : TextInputType.text,
              onChanged: onChanged,
              initialValue: initialValue,
              validator: validator,
              style: AppTextStyles.input,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: label,
                  labelStyle: AppTextStyles.input,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(
                          icon,
                          color: AppColors.primary,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.stroke,
                      )
                    ],
                  ),
                  border: InputBorder.none),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            )
          ],
        ),
      ),
    );
  }
}
