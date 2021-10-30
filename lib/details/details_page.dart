import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:daryo_uz_app/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1.0, 18.0),
                        blurRadius: 30.0,
                        color: Colors.blue.shade800.withOpacity(0.1),
                      )
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: getProportionateScreenHeight(16.0)),
                child: const MainTitle(isMenu: false),
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                style: TextStyle(
                  color: kPrimaryExtraColor,
                  fontSize: 14.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
