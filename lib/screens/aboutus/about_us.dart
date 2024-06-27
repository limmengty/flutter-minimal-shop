import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static String routeName = "/aboutus";

  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;
    const headingStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.5,
    );
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("About Us", style: headingStyle),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.settings),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                lang.aboutUS,
                style: headingStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 100,
                  child: Image.network(
                      "https://www.norton-u.com/images/logo-banner-blue.png")),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Year: III",
                      style: TextStyle(fontSize: kDefaultFontSize),
                    ),
                    const Text(
                      "Subject: Mobile Apps Development",
                      style: TextStyle(fontSize: kDefaultFontSize),
                    ),
                    const Text(
                      "Group: CO3MS1",
                      style: TextStyle(fontSize: kDefaultFontSize),
                    ),
                    const Text(
                      "Academic Year: 2023-2024",
                      style: TextStyle(fontSize: kDefaultFontSize),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                members[index].imageUrl,
                                width: 200,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  members[index].name,
                                  style: titleStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "ID: ${members[index].id}",
                                  style: const TextStyle(
                                      fontSize: kDefaultFontSize),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Member> members = [
  Member(
      name: "Lim Mengty",
      id: "B20220381",
      imageUrl: "assets/images/Mengty.JPG"),
  Member(
      name: "Luch Livannni", id: "B20221373", imageUrl: "assets/images/Ni.JPG"),
  Member(
      name: "Heng Mengsorng",
      id: "B20222763",
      imageUrl: "assets/images/Mengsorng.JPG"),
  Member(
      name: "Lim Ranith", id: "B20221881", imageUrl: "assets/images/Nith.jpg"),
];

class Member {
  final String name;
  final String id;
  final String imageUrl;

  Member({required this.name, required this.id, required this.imageUrl});
}
