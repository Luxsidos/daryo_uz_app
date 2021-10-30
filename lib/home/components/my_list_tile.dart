import 'package:daryo_uz_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MyListTile extends StatelessWidget {
  final VoidCallback voidCallback;
  final String img, title, id, time;
  const MyListTile({
    Key? key,
    required this.voidCallback,
    required this.img,
    required this.title,
    required this.time,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10.0)),
        height: getProportionateScreenHeight(70.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: id,
              child: Container(
                width: getProportionateScreenWidth(100.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                  color: kPrimaryExtraColor,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(8.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
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
              flex: 12,
            ),
          ],
        ),
      ),
      onTap: voidCallback,
    );
  }
}
