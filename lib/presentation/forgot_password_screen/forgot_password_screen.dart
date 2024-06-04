
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/forgot_password_screen_controller.dart';

class ForgotPasswordScreen extends GetWidget<ForgotPasswordScreenController> {
   ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor(context),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20),
                child: SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Bounce(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: getHeight(45),
                          width: getHeight(45),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1.5)),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorConstant
                                  .primaryBlack,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Text("My Wishlist",style: AppStyle.style(18,fontWeight: FontWeight.w600,fontColor: ColorConstant.transparent),),
                      Icon(Icons.add,color: Colors.transparent,)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Forgot password",
                        style: AppStyle.style(getFontSize(24),
                            fontColor: ColorConstant.primaryBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Gap(getHeight(8)),
                    
                    Gap(getHeight(60)),
                    
                    Obx(
                          () =>
                          CustomTextFormFiled(
                            text: AppString.phoneNumber,
                            hintText: AppString.enterPhone,
                            onChange: (p0) {
                              if (p0.isEmpty) {
                                controller.rxList[0].value = true;
                              } else {
                                controller.rxList[0].value = false;
                              }
                            },
                            isEmpty: controller.rxList[0].value,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                            inputFormatters: [
                              maskFormatter,
                            ],
                            controller: controller.mobileController,
                          ),
                    ),
                    Gap(getHeight(8)),
                    Gap(getHeight(8)),
                    Gap(getHeight(25)),
                    Obx(
                        ()=> AppElevatedButton(
                          buttonName: "Request OTP",
                          onPressed: () async {

                            // controller.isLogin();

                          }),
                    ),
                    Gap(getHeight(30)),
                    Gap(getHeight(35)),
                    
                    Gap(getHeight(35)),
                  ],
                ),
              ),
              

            ],
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
