import 'package:flutter/material.dart';
import 'package:hayyacom/utils/constants/assets_images.dart';

class BackgroundWidget extends StatelessWidget {

  final Widget child;

  const BackgroundWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.background),
          fit: BoxFit.fitHeight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: child,
    );

  }
}
