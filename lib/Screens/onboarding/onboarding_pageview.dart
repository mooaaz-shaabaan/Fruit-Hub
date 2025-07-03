import 'package:apppp/Screens/auth/login.dart';
import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/onBoarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageview extends StatefulWidget {
  const OnboardingPageview({super.key});
  static const String routeName = "onboarding";
  @override
  State<OnboardingPageview> createState() => _OnboardingPageviewState();
}

class _OnboardingPageviewState extends State<OnboardingPageview> {
  PageController controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          currentPage = index;
          setState(() {});
        },
        children: const [
          Onboarding(
            image: "assets/imageOn2 (2).png",
            title: "",
            appbarTitle: "تخطي",
            subTitle:
                "اكتشف تجربة تسوق فريدة مع FruitHUB . استكشف مجموعتنا الواسعة من الفواكة الطازجو و الممتازة واحصل علي افضل العروض و الجودة العالية",
          ),
          Onboarding(
            image: "assets/imageOn2.png",
            title: "ابحث و تسوق",
            subTitle:
                "نقدم لك افضل الفواكة المختارة بعناية . اطلع علي التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكة المثالية",
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 150,
        width: double.infinity,
        child: Column(
          children: [
            SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: const WormEffect(),
            ),
            if (currentPage == 1)
              Padding(
                padding: const EdgeInsets.all(17),
                child: CustomButton(
                  text: "ابدأ الأن",
                  onPressed: () => Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => Login()),
),

                ),
              ),
          ],
        ),
      ),
    );
  }
}
