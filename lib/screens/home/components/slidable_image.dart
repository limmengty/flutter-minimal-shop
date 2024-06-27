import 'package:ass_minimal_shop/constants.dart';
import 'package:ass_minimal_shop/helper/language_heper.dart';
import 'package:ass_minimal_shop/services/cache_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlidableImage extends StatefulWidget {
  const SlidableImage({super.key});

  @override
  State<SlidableImage> createState() => _SlidableImageState();
}

class _SlidableImageState extends State<SlidableImage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    CacheMinimalAppLanguage lang = context.watch<CacheLogic>().cacheLang;

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: size.height / 4,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  allowImplicitScrolling: true,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Image.network(
                        "https://m.media-amazon.com/images/I/618h-H-R+ZL._AC_SX444_SY639_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/71WBwf2mkXL._AC_SX444_SY639_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/71Hx8b6HGbL._AC_SX444_SY639_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/61ctbs1MWmL._AC_SX444_SY639_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/618zZ7u3sUL._AC_SX444_SY639_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/71HewUVN1uL._AC_SR525,789_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                    Image.network(
                        "https://m.media-amazon.com/images/I/91cKXdspPPL._AC_SX444_SY639_FMwebp_QL65_.jpg",
                        fit: BoxFit.contain),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: size.width / 3.4,
              right: size.width / 4,
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                    itemCount: 7,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 5,
                        width: pageIndex == index ? 20 : 10,
                        decoration: BoxDecoration(
                          color: pageIndex == index
                              ? kPrimaryLightColor
                              : kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              left: 140,
              right: 140,
              bottom: -21,
              child: MaterialButton(
                onPressed: () {},
                height: 40,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                color: kPrimaryLightColor,
                child: Text(
                  lang.shopNow,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
