import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/details/details_page.dart';
import 'package:daryo_uz_app/home/components/my_list_tile.dart';
import 'package:daryo_uz_app/models/news_model.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:daryo_uz_app/widgets/main_title.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<List<News>>(
          stream: getData(),
          builder: (context, AsyncSnapshot<List<News>> snapshot) {
            if (snapshot.hasData) {
              List<News> data = snapshot.data!;
              var htmlData = parse(data[0].content!.rendered);

              var img = "http:" +
                  (htmlData.getElementsByTagName("img")[0].attributes['src'])
                      .toString();

              DateTime dateData = data[0].modifiedGmt!;
              String time =
                  "${dateData.day}/${dateData.month}/${dateData.year} ${dateData.hour}:${dateData.minute}";

              return CustomScrollView(
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
                          MainTitle(
                            id: data[0].id.toString() + "m",
                            time: time,
                            isMenu: true,
                            img: img,
                            content: data[0].content!.rendered!,
                            title: data[0].slug.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16.0),
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        var htmlDatas = parse(data[index].content!.rendered);
                        String? img;
                        DateTime dateData = data[index].modifiedGmt!;
                        String time =
                            "${dateData.day}/${dateData.month}/${dateData.year} ${dateData.hour}:${dateData.minute}";
                        try {
                          img = "http:" +
                              (htmlDatas
                                      .getElementsByTagName("img")[0]
                                      .attributes['src'])
                                  .toString();
                        } catch (e) {
                          img =
                              "https://webhostingmedia.net/wp-content/uploads/2018/01/http-error-404-not-found.png";
                        }
                        return MyListTile(
                          id: data[index].id!.toString(),
                          title: data[index].slug!,
                          img: img,
                          time: time,
                          voidCallback: () => Get.to(
                            DetailsPage(
                              id: data[index].id!.toString(),
                              img: img!,
                              title: data[index].slug!,
                              time: time,
                              content: data[index].content!.rendered!,
                            ),
                            transition: Transition.cupertino,
                          ),
                        );
                      }, childCount: data.length),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            } else {
              return Center(child: Text(snapshot.error.toString()));
            }
          },
        ),
      ),
    );
  }

  Stream<List<News>> getData() async* {
    try {
      var response =
          await Dio().get("https://admin.daryo.uz/wp-json/wp/v2/posts");
      yield (response.data as List).map((e) => News.fromJson(e)).toList();
    } catch (e) {
      throw Exception("ERROR: 2" + e.toString());
    }
  }
}
