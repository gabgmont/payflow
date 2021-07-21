import 'package:flutter/material.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [MeusBoletosPage(), ExtractPage()];

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
                        text: widget.user.name,
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
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoURL!),
                  ),
                ),
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
                color: homeController.currentPage == 0
                    ? AppColors.primary
                    : AppColors.body,
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
                onPressed: () async {
                  print('clicou');
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
                  // Navigator.pushNamed(context, '/insert_boleto');
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.description_outlined,
                color: homeController.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
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

  void updateBoletos() {
    setState(() {});
  }
}
