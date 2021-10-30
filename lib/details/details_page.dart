import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:daryo_uz_app/widgets/main_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  final String img, title, content, id, time;
  const DetailsPage({
    Key? key,
    required this.time,
    required this.id,
    required this.img,
    required this.title,
    required this.content,
  }) : super(key: key);

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
                child: MainTitle(
                  time: time,
                  id: id,
                  title: title,
                  isMenu: false,
                  img: img,
                  content: content,
                ),
              ),
              Text(
                content,
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
