
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_app_text_form_field.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/create_account_controller.dart';

class CreateAccountScreen extends GetWidget<CreateAccountScreenController> {
   CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor(context),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(25),vertical: getHeight(25)),
                    child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  AppString.createAccount,
                  style: AppStyle.style(getFontSize(24),
                      fontColor: ColorConstant.primaryBlack,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Gap(getHeight(8)),
              Center(
                child: Text(
                  AppString.fillTheInformationToReg,
                  textAlign: TextAlign.center,
                  style: AppStyle.style(getFontSize(12),
                      fontColor: ColorConstant.primaryBlack.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Gap(getHeight(20)),

              Obx(
                () => CustomTextFormFiled(
                  text: AppString.name,
                  hintText: AppString.enterName,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[0].value = true;
                    } else {
                      controller.rxList[0].value = false;
                    }
                  },
                  isEmpty: controller.rxList[0].value,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  controller:  controller.authServices.nameController.value,
                ),
              ),
              Gap(getHeight(8)),

              Obx(
                () => CustomTextFormFiled(
                  text: AppString.phoneNumber,
                  hintText: AppString.enterPhone,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[1].value = true;
                    } else {
                      controller.rxList[1].value = false;
                    }
                  },
                  inputFormatters: [
                    maskFormatter],
                  isEmpty: controller.rxList[1].value,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.phone,
                  controller: controller.authServices.emailController.value,
                ),
              ),
              Gap(getHeight(8)),

              Obx(
                () => CustomTextFormFiled(
                  text: AppString.password,
                  hintText: AppString.enterPassword,
                  onChange: (p0) {
                    if (p0.isEmpty) {
                      controller.rxList[2].value = true;
                    } else {
                      controller.rxList[2].value = false;
                    }
                  },
                  isObscureText: controller.isVisible.value ? false : true,
                  suffixIcons: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        controller.iSVisibleFun();
                      },
                      icon: Icon(
                        controller.isVisible.value
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        color: ColorConstant.grey9DA,
                      )),
                  isEmpty: controller.rxList[2].value,
                  textInputAction: TextInputAction.done,
                  controller:controller.authServices.passwordController.value,
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      checkColor: ColorConstant.primaryWhite,
                      activeColor: ColorConstant.primaryColor,
                      value: controller.checkBox.value,
                      onChanged: (value) {
                        controller.checkBox.toggle();
                      },
                    ),
                  ),

                  RichText(
                      textScaler: const TextScaler.linear(1.0),
                      text: TextSpan(
                        text: AppString.agreeWith,
                        style: AppStyle.style(getFontSize(13),
                            fontColor: ColorConstant.primaryBlack,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: AppString.termsAndCondition,
                            style: AppStyle.style(
                              getFontSize(13),
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              fontColor: ColorConstant.primaryColor,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Gap(getHeight(20)),

              Obx(
                  ()=> AppElevatedButton(

                    buttonName: AppString.signUp,
                    onPressed: ()async {
                      ProgressDialogUtils.showProgressDialog();
                    // await  controller.isLogin();
                      ProgressDialogUtils.hideProgressDialog();

                    }),
              ),
              Gap(getHeight(25)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 2,
                      width: 70,
                    color: ColorConstant.greyD3,
                  ),
                  Text(AppString.orSignUpWith,style: AppStyle.style(getFontSize(14),fontColor: ColorConstant.primaryBlack.withOpacity(0.5),fontWeight: FontWeight.w500),),
                  Container(
                    height: 2,
                    width: 70,
                    color: ColorConstant.greyD3,
                  )
                ],
              ),
              Gap(getHeight(30)),

              SizedBox(
                width: getWidth(190),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _customButton(icon: ImageConstant.apple, onTap: (){}),
                    _customButton(icon: ImageConstant.google, onTap: ()async{

                    }),
                    _customButton(icon: ImageConstant.faceBook, onTap: (){}),
                  ],
                ),
              ),
              Gap(getHeight(30)),
              Bounce(
                onTap: (){
                  Get.toNamed(AppRoutes.loginScreenRoute);
                },
                child: RichText(
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(1.0),
                    text: TextSpan(
                      text: AppString.alreadyHaveAcc,
                      style: AppStyle.style(getFontSize(14),
                          fontColor: ColorConstant.primaryBlack,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text: AppString.signIn,
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
  Widget _customButton({required String icon,required void Function() onTap}){
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
          child: SvgPicture.asset(icon,width:30,),
        ),
      ),
    );
  }
  final  maskFormatter = MaskTextInputFormatter(
      mask: '+91##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
