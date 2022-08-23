import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/modules/authenticationscreen/controllers/authenticationscreen_controller.dart';
import 'package:newsapp/app/modules/constants/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: '',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "do you want to sure Logout?",
                          style: GoogleFonts.montserrat(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  AuthenticationscreenController.instance
                                      .logout();
                                },
                                child: Text("Logout")),
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("No")),
                          ],
                        )
                      ],
                    ),
                    radius: 10.0);

                // Get.defaultDialog();
                // AuthenticationscreenController.instance.logout();
                print("${controller.baseUrl + controller.apikey}");
              },
              icon: Icon(Icons.logout)),
          title: Text(
            'NY TIMES POST POPLAR ARTICLES',
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
          actions: [],
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: controller.fetchdatas(),
          builder: (context, snapshot) => Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Card(
                  child: ListView.builder(
                    itemCount: controller.articles.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(controller
                                    .articles[index]
                                    .media!
                                    .first
                                    .mediaMetadata!
                                    .last
                                    .url!),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 9,
                            ),
                            Container(
                              height: getheight(context, 14),
                              width: getwidth(context, 57),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    controller.articles[index].title.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.articles[index].byline
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Row(
                                    children: [
                                      Text(controller.articles[index].source
                                          .toString()),
                                      Spacer(),
                                      Text(controller
                                          .articles[index].publishedDate
                                          .toString())
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              final url = "${controller.articles[index].url}";
                              url != null
                                  ? controller.makeOpenLink(url)
                                  : Get.snackbar("cdc", "czd");
                            },
                            icon: Icon(Icons.arrow_forward_ios_outlined))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
