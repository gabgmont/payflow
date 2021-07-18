import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [Container(color: Colors.red), Container(color: Colors.blue)];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.23),
        child: Container(
          height: size.height * 0.23,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                        text: 'Gabriel!',
                        style: AppTextStyles.titleBoldBackground)
                  ],
                ),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia.',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: AppColors.primary,
              ),
              onPressed: () {
                homeController.setPage(0);
                setState(() {});
              },
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, "/barcode_scanner");
                  Navigator.pushNamed(context, '/insert_boleto');

                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
