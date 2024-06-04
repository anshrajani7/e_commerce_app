


import 'package:gap/gap.dart';


import '../../core/app_export.dart';
import 'controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);
    return Scaffold();
  }


}
