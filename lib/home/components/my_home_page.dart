/*import 'package:blogapp/models/admin_models.dart';
import 'package:blogapp/models/news_models.dart';
import 'package:blogapp/screens/admin/admin_sign_page.dart';
import 'package:blogapp/screens/info_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              const Text(
                "News Home Page",
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminSignPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "New App",
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: StreamBuilder<List<NewsModel>>(
        stream: _fetchData(),
        builder: (context, AsyncSnapshot<List<NewsModel>> snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      snap.data![index].image.toString(),
                    ),
                  ),
                  title: Text(snap.data![index].title.toString()),
                  subtitle: Text(
                    snap.data![index].content.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.tealAccent,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                          data: snap.data![index],
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: snap.data!.length,
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 20.0,
              ),
            );
          }
        },
      ),
    );
  }

  Stream<List<NewsModel>> _fetchData() async* {
    try {
      var response = await Dio().get('http://localhost:3000/news');
      print(response);
      yield (response.data as List).map((e) => NewsModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw Exception("FETCH DATA ERROR !");
    }
  }
}
*/