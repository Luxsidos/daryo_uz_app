import 'package:daryo_uz_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class MyListTile extends StatelessWidget {
  final VoidCallback voidCallback;
  const MyListTile({Key? key, required this.voidCallback}) : super(key: key);

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
            Container(
              width: getProportionateScreenWidth(100.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://source.unsplash.com/random"),
                  fit: BoxFit.cover,
                ),
                color: kPrimaryExtraColor,
                borderRadius: BorderRadius.circular(24.0),
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
                    const Expanded(
                      child: Text(
                        "Contact Lost WIth Sriwijaya Air Boeing 737- 500 After Take Off",
                        style: TextStyle(
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
                        "30 October 2021",
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
