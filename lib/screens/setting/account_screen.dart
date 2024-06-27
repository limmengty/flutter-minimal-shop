import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/screens/setting/components/setting_item.dart';
import 'package:ass_minimal_shop/screens/setting/components/setting_switch.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
  static String routeName = "/account";
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  final headingStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  @override
  Widget build(BuildContext context) {
    final indexMode = context.read<CacheLogic>().modeIndex;
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Settings",
      //     style: headingStyle,
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {}, icon: const Icon(Icons.more_horiz_outlined)),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.settings,
                style: headingStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/117325886?s=400&u=1e2ddee9adada0ac73c6b06e6f9c207f1447c44c&v=4"),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mengty",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "limmengti@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              SettingItem(
                title: lang.myAdress,
                icon: Ionicons.location,
                bgColor: const Color.fromARGB(255, 179, 227, 215),
                iconColor: const Color.fromARGB(255, 7, 137, 54),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: lang.account,
                icon: Ionicons.person,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: lang.notification,
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: lang.devices,
                icon: Ionicons.phone_portrait,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: lang.passwordAndSecurity,
                icon: Ionicons.key,
                bgColor: const Color.fromARGB(255, 210, 207, 207),
                iconColor: const Color.fromARGB(255, 113, 111, 111),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.read<CacheLogic>().changeToEN();
                },
                child: SettingItem(
                  title: lang.changeToEN,
                  icon: Ionicons.earth,
                  bgColor: Colors.pink.shade100,
                  iconColor: Colors.pink,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.read<CacheLogic>().changeToKH();
                },
                child: SettingItem(
                  title: lang.changeToKH,
                  icon: Ionicons.locate_outline,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.read<CacheLogic>().changeToSystem();
                },
                child: SettingItem(
                  title: lang.systemMode,
                  icon: Ionicons.phone_portrait,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.read<CacheLogic>().changeToLight();
                },
                child: SettingItem(
                  title: lang.lightMode,
                  icon: Ionicons.diamond,
                  bgColor: Colors.green.shade100,
                  iconColor: Colors.green,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.read<CacheLogic>().changeToDark();
                },
                child: SettingItem(
                  title: lang.dartMode,
                  icon: Ionicons.moon,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: lang.helpCenter,
                icon: Ionicons.help,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
