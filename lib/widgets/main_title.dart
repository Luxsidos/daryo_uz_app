import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/details/details_page.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class MainTitle extends StatelessWidget {
  final String img, title, id, content, time;
  final bool isMenu;
  const MainTitle({
    Key? key,
    required this.time,
    required this.content,
    required this.id,
    required this.isMenu,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isMenu
          ? () => Get.to(
                DetailsPage(
                  id: id,
                  img: img,
                  time: time,
                  title: title,
                  content: content,
                ),
                transition: Transition.cupertino,
              )
          : null,
      child: Container(
        height: isMenu ? getProportionateScreenHeight(260.0) : null,
        decoration: isMenu
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1.0, 4.0),
                    blurRadius: 30.0,
                    color: Colors.blue.shade800.withOpacity(0.1),
                  )
                ],
              )
            : null,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: id,
                child: Container(
                  height: getProportionateScreenHeight(170.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                    color: kPrimaryExtraColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              flex: isMenu ? 1 : 0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(isMenu ? 14.0 : 0.0),
                vertical: getProportionateScreenHeight(16.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: isMenu ? TextOverflow.ellipsis : null,
                    maxLines: isMenu ? 2 : null,
                  ),
                  SizedBox(height: getProportionateScreenHeight(12.0)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      time,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: kPrimaryExtraColor,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
