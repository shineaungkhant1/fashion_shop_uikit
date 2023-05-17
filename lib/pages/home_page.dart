import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_shop_uikit/pages/detail_page.dart';
import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:fashion_shop_uikit/viewitems/recommended_item_page_view.dart';
import 'package:fashion_shop_uikit/viewitems/trending_page_view.dart';
import 'package:flutter/material.dart';

const kAnimationDurationForScreenFadeIn = Duration(milliseconds: 1000);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChangeBackgroundColor = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = screenHeight / 28;
    return Scaffold(
      body: AnimatedContainer(
        duration: kAnimationDurationForScreenFadeIn,
        color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: TweenAnimationBuilder(
                            duration: kAnimationDurationForScreenFadeIn,
                            builder: (context, double value, child) => Opacity(
                              opacity: value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: MARGIN_LARGE,
                                  vertical: value * MARGIN_XXLARGE,
                                ),
                                child: child,
                              ),
                            ),
                            tween: Tween<double>(begin: 0, end: 1),
                            child: ProfileSectionView(
                              avatarRadius: avatarRadius,
                              isChangeBackgroundColor: isChangeBackgroundColor,
                              onTap: () {
                                setState(() {
                                  isChangeBackgroundColor =
                                      !isChangeBackgroundColor;
                                });
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: TweenAnimationBuilder(
                            duration: kAnimationDurationForScreenFadeIn,
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, double value, child) => Opacity(
                              opacity: value,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 140,
                                  left: value * MARGIN_MEDIUM_3,
                                  right: MARGIN_MEDIUM_3,
                                ),
                                child: child,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailPage(),
                                  ),
                                );
                              },
                              child: TrendingSectionView(
                                screenHeight: screenHeight,
                                isChangeBackgroundColor:
                                    isChangeBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TweenAnimationBuilder(
                            duration: kAnimationDurationForScreenFadeIn,
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, double value, child) => Opacity(
                              opacity: value,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: MARGIN_MEDIUM_3,
                                  right: MARGIN_MEDIUM_3,
                                  bottom: value * MARGIN_XXLARGE,
                                ),
                                child: child,
                              ),
                            ),
                            child: RecommendedSectionView(
                              screenHeight: screenHeight,
                              isChangeBackgroundColor: isChangeBackgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: MARGIN_3XLARGE,
                  )
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MARGIN_MEDIUM_3,
                  left: MARGIN_MEDIUM_3,
                  right: MARGIN_MEDIUM_3,
                ),
                child: BottomNavigationBarSectionView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarSectionView extends StatelessWidget {
  const BottomNavigationBarSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_XXLARGE),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BottomNavIconView(
              icon: Icons.other_houses, color: BLUE_DARK_COLOR),
          const BottomNavIconView(icon: Icons.search_outlined),
          const BottomNavIconView(
            icon: Icons.shopping_bag_outlined,
            size: MARGIN_XXLARGE - 6,
          ),
          const BottomNavIconView(
            icon: Icons.bookmark_border,
            size: MARGIN_XXLARGE - 12,
          ),
          CircleAvatar(
            radius: screenHeight / 35,
            backgroundImage: const NetworkImage(
                "https://www.shefinds.com/files/2022/12/Kendall-Jenner-.jpg"),
          )
        ],
      ),
    );
  }
}

class BottomNavIconView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const BottomNavIconView({
    super.key,
    required this.icon,
    this.color = HOME_PAGE_ICON_COLOR,
    this.size = MARGIN_XXLARGE - 8,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}

class RecommendedSectionView extends StatelessWidget {
  const RecommendedSectionView({
    Key? key,
    required this.screenHeight,
    required this.isChangeBackgroundColor,
  }) : super(key: key);

  final double screenHeight;
  final bool isChangeBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleAndIndicatorSectionView(
          title: "Recommended",
          isChangeBackgroundColor: isChangeBackgroundColor,
        ),
        const SizedBox(height: MARGIN_LARGE),
        const RecommendedItemView(),
      ],
    );
  }
}

class TrendingSectionView extends StatelessWidget {
  const TrendingSectionView({
    Key? key,
    required this.screenHeight,
    required this.isChangeBackgroundColor,
  }) : super(key: key);

  final double screenHeight;
  final bool isChangeBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleAndIndicatorSectionView(
          title: "Trending for you",
          isChangeBackgroundColor: isChangeBackgroundColor,
        ),
        const SizedBox(height: MARGIN_LARGE),
        const TrendingPageView(),
      ],
    );
  }
}

class TitleAndIndicatorSectionView extends StatelessWidget {
  final String title;
  final bool isChangeBackgroundColor;

  const TitleAndIndicatorSectionView(
      {super.key, required this.title, required this.isChangeBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w600,
            color: (isChangeBackgroundColor) ? Colors.white : Colors.black,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: const DotsDecorator(
            color: Color.fromRGBO(187, 186, 195, 1.0),
            activeColor: Color.fromRGBO(47, 43, 76, 1.0),
            size: Size(7, 7),
            activeSize: Size(7, 7),
          ),
        ),
      ],
    );
  }
}

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    Key? key,
    required this.avatarRadius,
    required this.onTap,
    required this.isChangeBackgroundColor,
  }) : super(key: key);

  final double avatarRadius;
  final Function onTap;
  final bool isChangeBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: const NetworkImage(
                "https://c4.wallpaperflare.com/wallpaper/277/806/444/kendall-jenner-celebrities-girls-model-wallpaper-preview.jpg"
              ),
            ),
            const SizedBox(width: MARGIN_MEDIUM_2),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kendall Nicole Jenner,",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: TEXT_REGULAR_3X,
                    color:
                        (isChangeBackgroundColor) ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: MARGIN_SMALL),
                Text(
                  "Kendall Jenner",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_REGULAR_3X,
                    color:
                        (isChangeBackgroundColor) ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 50,
          width: 45,
          // color: Colors.blueAccent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    onTap();
                  },
                  child: const Icon(
                    Icons.notifications_none,
                    color: HOME_PAGE_ICON_COLOR,
                    size: MARGIN_XLARGE + 3,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM,
                    right: MARGIN_SMALL,
                  ),
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(214, 171, 200, 1.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
