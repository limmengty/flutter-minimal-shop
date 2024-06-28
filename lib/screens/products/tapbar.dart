import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/models/tapbar.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapBar extends StatefulWidget {
  TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  TapbarModel tapBar = TapbarModel();
  int current = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;
    List<String> items = [
      lang.allTitle,
      lang.phoneTitle,
      lang.computerTitle,
      lang.mouseTitle,
      lang.keyboardTitle,
      lang.headsetTitle,
      lang.bagTitle
    ];
    return SizedBox(
      width: double.infinity,
      height: 760,
      child: Column(
        children: [
          /// Tab Bar
          SizedBox(
            width: double.infinity,
            height: 70,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                        pageController.animateToPage(
                          current,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(
                          color: current == index
                              ? Colors.transparent.withOpacity(.3)
                              : Colors.transparent.withOpacity(.05),
                          borderRadius: current == index
                              ? BorderRadius.circular(12)
                              : BorderRadius.circular(7),
                          border: current == index
                              ? Border.all(color: kPrimaryColor, width: 2.5)
                              : null,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                items[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: current == index,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),

          /// MAIN BODY
          Expanded(
            child: PageView.builder(
              itemCount: tapBar.screen.length,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  current = index;
                });
              },
              itemBuilder: (context, index) {
                return tapBar.screen[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
