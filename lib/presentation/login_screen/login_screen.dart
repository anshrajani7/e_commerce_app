
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../core/app_export.dart';
import 'controller/login_screen_controller.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor(context),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(25), vertical: getHeight(50)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      AppString.signIn,
                      style: AppStyle.style(getFontSize(24),
                          fontColor: ColorConstant.primaryBlack,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Gap(getHeight(8)),
                  Center(
                    child: Text(
                      AppString.hiWelcomBack,
                      textAlign: TextAlign.center,
                      style: AppStyle.style(getFontSize(12),
                          fontColor: ColorConstant.primaryBlack.withOpacity(
                              0.6),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Gap(getHeight(60)),


                  Gap(getHeight(8)),

                  Gap(getHeight(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.toNamed(AppRoutes.forgotPasswordScreenRoute);
                        },
                        child: Text(AppString.forgatePassword, style: AppStyle.style(
                            getFontSize(13),
                            fontColor: ColorConstant.primaryColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Gap(getHeight(25)),
                  // Obx(
                  //     ()=> AppElevatedButton(
                  //       isLoading: AuthService.isApiLoading.value,
                  //       buttonName: AppString.signIn,
                  //       onPressed: ()async {
                  //         ProgressDialogUtils.showProgressDialog();
                  //       await  controller.isLogin();
                  //         ProgressDialogUtils.hideProgressDialog();
                  //
                  //       }),
                  // ),
                  Gap(getHeight(30)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2,
                        width: 70,
                        color: ColorConstant.greyD3,
                      ),
                      Text(AppString.orSignUpWith, style: AppStyle.style(
                          getFontSize(14),
                          fontColor: ColorConstant.primaryBlack.withOpacity(
                              0.5), fontWeight: FontWeight.w500),),
                      Container(
                        height: 2,
                        width: 70,
                        color: ColorConstant.greyD3,
                      )
                    ],
                  ),
                  Gap(getHeight(35)),
                  SizedBox(
                    width: getWidth(190),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _customButton(icon: ImageConstant.apple, onTap: () {


                        }),
                        _customButton(icon: ImageConstant.google, onTap: ()async {

                                                }),
                        _customButton(
                            icon: ImageConstant.faceBook, onTap: () async{
                        }),
                      ],
                    ),
                  ),
                  Gap(getHeight(35)),
                  Bounce(
                    onTap: (){
                      // Get.toNamed(AppRoutes.createAccountScreenRoute);
                    },
                    child: RichText(
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1.0),
                        text: TextSpan(
                          text: AppString.donHaveAccount,
                          style: AppStyle.style(getFontSize(14),
                              fontColor: ColorConstant.primaryBlack,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                              text: AppString.signUp,
                              style: AppStyle.style(
                                getFontSize(14),
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                fontColor: ColorConstant.primaryColor,
                              ),
                            ),
                          ],
                        )),
                  )

                ],
              ),
            ),
          )),
    );
  }

  Widget _customButton({required String icon, required void Function() onTap}) {
    return Bounce(
      onTap: onTap,
      child: Container(
        height: getHeight(55),
        width: getHeight(55),
        decoration: BoxDecoration(
            color: ColorConstant.primaryWhite,
            border: Border.all(color: ColorConstant.greyD3,
                width: 2),
            shape: BoxShape.circle
        ),
        child: Center(
          child: SvgPicture.asset(icon, width: 30,),
        ),
      ),
    );
  }
  final  maskFormatter = MaskTextInputFormatter(
      mask: '+91##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
