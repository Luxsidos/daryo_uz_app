import 'package:daryo_uz_app/auth/login_page.dart';
import 'package:daryo_uz_app/constants.dart';
import 'package:daryo_uz_app/details/details_page.dart';
import 'package:daryo_uz_app/home/components/my_list_tile.dart';
import 'package:daryo_uz_app/models/news_model.dart';
import 'package:daryo_uz_app/size_config.dart';
import 'package:daryo_uz_app/widgets/main_title.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

FirebaseAuth _authUser = FirebaseAuth.instance;

class _HomePageState extends State<HomePage> {
  List<News> news = [];

  bool isRefresh = true;
  bool isNew = true;
  int currentPage = 1;

  Future<List<News>> getData() async {
    try {
      var response = await Dio().get(
          "https://admin.daryo.uz/wp-json/wp/v2/posts?page=${currentPage}");

      List<News> jsonData =
          (response.data as List).map((e) => News.fromJson(e)).toList();

      currentPage += 1;

      if (isNew) {
        news = jsonData;
        isNew = false;
      } else if (!isRefresh) {
        news.addAll(jsonData);
        isRefresh = true;
      }

      setState(() {});
      return news;
    } catch (e) {
      throw Exception("ERROR: 2" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () async {
            isRefresh = true;
            setState(() {});
          },
          child: FutureBuilder<List<News>>(
            future: getData(),
            builder: (context, AsyncSnapshot<List<News>> snapshot) {
              if (snapshot.hasData) {
                List<News> data = snapshot.data!;
                var htmlData = parse(data[0].content!.rendered);
                String? img;
                try {
                  img = "http:" +
                      (htmlData
                              .getElementsByTagName("img")[0]
                              .attributes['src'])
                          .toString();
                } catch (e) {
                  img =
                      "https://webhostingmedia.net/wp-content/uploads/2018/01/http-error-404-not-found.png";
                }

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
                                vertical: getProportionateScreenHeight(16.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Daryo uz",
                                      style: GoogleFonts.comfortaa(
                                        color: kPrimaryColor,
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.logout,
                                      color: kPrimaryColor,
                                    ),
                                    onPressed: () async {
                                      try {
                                        await _authUser.signOut();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()),
                                            (route) => true);
                                      } catch (e) {
                                        Get.snackbar(
                                          "Error",
                                          "Try again!",
                                        );
                                      }
                                    },
                                  )
                                ],
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
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ElevatedButton(
                            onPressed: () async {
                              isRefresh = false;
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor),
                            child: const Text("Next1"),
                          ),
                        ],
                      ),
                    )
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
      ),
    );
  }
}
