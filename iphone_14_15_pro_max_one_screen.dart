import 'package:flutter/material.dart';
import 'package:priyansh_s_application1/core/app_export.dart';
import 'package:priyansh_s_application1/widgets/custom_elevated_button.dart';
import 'package:priyansh_s_application1/widgets/custom_text_form_field.dart';

class Iphone1415ProMaxOneScreen extends StatelessWidget {
  Iphone1415ProMaxOneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildSignUpSection(context),
                    Spacer(
                      flex: 29,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 26.h,
                        right: 24.h,
                      ),
                      child: CustomTextFormField(
                        controller: emailController,
                        hintText: "Enter Email",
                        textInputType: TextInputType.emailAddress,
                        contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                      ),
                    ),
                    SizedBox(height: 98.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Enter Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    Spacer(
                      flex: 21,
                    ),
                    CustomElevatedButton(
                      width: 198.h,
                      text: "Sign Up",
                      margin: EdgeInsets.only(left: 107.h),
                      buttonStyle: CustomButtonStyles.none,
                      decoration:
                          CustomButtonStyles.gradientGreenAToGreenADecoration,
                      alignment: Alignment.centerLeft,
                    ),
                    Spacer(
                      flex: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpSection(BuildContext context) {
    return Container(
      width: 428.h,
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 41.h,
        vertical: 60.v,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgGroup16,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.v),
          Text(
            "Sign Up",
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
