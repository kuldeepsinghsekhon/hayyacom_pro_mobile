import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const Hayyacom());
}

class Hayyacom extends StatelessWidget {
  const Hayyacom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ResponsiveSizer(builder: (context, orientation, screenType) =>
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hayyacom',
        defaultTransition: Transition.rightToLeft,
        locale: const Locale('en', 'US'),
      )

    );
  }
}