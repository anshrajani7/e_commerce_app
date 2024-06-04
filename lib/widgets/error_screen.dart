import 'package:lottie/lottie.dart';

import '../core/app_export.dart';

/// Screen For replacement of flutter red error Screen
class AppFlutterErrorScreen extends StatelessWidget {
  final FlutterErrorDetails? details;
  final String? working;
  const AppFlutterErrorScreen({
    super.key,
     this.details, this.working,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: getHeight(150),
                    child: Lottie.asset(
                        'assets/animation/error_cat_animation.json')),
                const SizedBox(height: 20),
                Text(
                  details?.exceptionAsString()??working??'Error',
                  style: AppStyle.style(18,fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
