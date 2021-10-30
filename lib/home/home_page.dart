import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/details/details_page.dart';
import 'package:daryo_uz_app/home/components/my_list_tile.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:daryo_uz_app/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16.0),
                  vertical: getProportionateScreenHeight(12.0)),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(18.0),
                      ),
                      child: Text(
                        "Daryo uz",
                        style: GoogleFonts.comfortaa(
                          color: kPrimaryColor,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const MainTitle(isMenu: true),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(16.0),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return MyListTile(
                      voidCallback: () => Get.to(
                        const DetailsPage(),
                        transition: Transition.cupertino,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
