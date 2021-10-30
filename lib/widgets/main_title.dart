import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(260.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(1.0, 4.0),
            blurRadius: 30.0,
            color: Colors.blue.shade800.withOpacity(0.1),
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://source.unsplash.com/random"),
                  fit: BoxFit.cover,
                ),
                color: kPrimaryExtraColor,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(14.0),
              vertical: getProportionateScreenHeight(16.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Contact Lost WIth Sriwijaya Air Boeing 737- 500 After Take Off",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: getProportionateScreenHeight(12.0)),
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
        ],
      ),
    );
  }
}
