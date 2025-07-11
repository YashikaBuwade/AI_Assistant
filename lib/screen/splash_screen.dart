import 'package:ai_assistant/screen/onboarding_screen.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../helper/global.dart';
import '../helper/pref.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //  wait for sometime on splash screen
    Future.delayed(const Duration(seconds: 5), () {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => pref.showOnboarding ?
      //   const OnboardingScreen() :
      //   const HomeScreen()),
      // );
      Get.off( () =>
      pref.showOnboarding
             ? const OnboardingScreen()
             : const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 2,),
            // logo
            Card(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: mq.width * 0.4,
                ),
              ),
            ),
            //  for adding some space
            Spacer(),
            // for lottie loading
            CustomLoading(),
            // for adding some space
            Spacer(),
          ],
        ),
      ),
    );
  }
}


