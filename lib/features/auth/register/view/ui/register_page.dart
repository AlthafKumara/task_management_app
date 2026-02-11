import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_management_app/features/auth/login/constants/login_constant.dart';
import 'package:task_management_app/features/auth/register/constants/register_constant.dart';
import 'package:task_management_app/features/auth/register/controllers/register_controller.dart';
import 'package:task_management_app/shared/styles/app_color.dart';
import 'package:task_management_app/shared/widgets/global_button.dart';
import 'package:task_management_app/shared/widgets/global_switch.dart';
import 'package:task_management_app/shared/widgets/global_textfield.dart';
import 'package:task_management_app/utils/functions/validator.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: _body(context),
      bottomNavigationBar: _bottomnav(context),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
      actions: [
        Obx(
          () => SizedBox(
            child: GlobalSwitch.flagSwitch(
              context: context,
              value: controller.flagSwitchC.isEnglish.value,
              onChanged: (value) {
                controller.flagSwitchC.toggleFlag();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.check, color: AppColor.black, size: 25.sp),
              ),
              SizedBox(height: 16.h),
              Text(
                RegisterConstant.registerTitle.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 8.h),
              Text(
                RegisterConstant.registerDescription.tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 24.h),
              GlobalTextfield.textFieldLarge(
                context: context,
                hintText: RegisterConstant.name.tr,
                controller: controller.nameController,
                keyboardType: TextInputType.emailAddress,
                validator: FieldValidator.validateName,
                label: RegisterConstant.name.tr,
              ),
              SizedBox(height: 16.h),
              GlobalTextfield.textFieldLarge(
                context: context,
                hintText: RegisterConstant.email.tr,
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: FieldValidator.validateEmail,
                label: RegisterConstant.email.tr,
              ),
              SizedBox(height: 16.h),
              Obx(
                () => GlobalTextfield.textFieldLarge(
                  context: context,
                  hintText: RegisterConstant.password.tr,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: controller.isPasswordVisible.value,
                  validator: FieldValidator.validatePassword,
                  label: RegisterConstant.password.tr,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    LoginConstant.forgotPassword.tr,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              SizedBox(height: 64.h),
              Row(
                children: [
                  Expanded(
                    child: GlobalButton.primaryButton(
                      context: context,
                      textButton: RegisterConstant.registerButton.tr,
                      onPressed: () {
                        controller.handleRegister();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomnav(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            RegisterConstant.haveAccount.tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: () {
              controller.navigateToLogin();
            },
            child: Text(
              RegisterConstant.login.tr,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
