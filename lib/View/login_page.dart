import 'package:flutter/material.dart';
import 'package:fonify/Controller/login_Controller.dart';
import 'package:fonify/Core/Theme/app_color.dart';
import 'package:fonify/Core/Widgets/social_login_buttons.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
    bool isFormValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back),
      ),
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        
        child: Padding(padding: EdgeInsets.symmetric(vertical: 10, ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Log in to Market Place", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textLogin),)],),
              SizedBox(height: 5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text('Welcome back! Sign in using your social\n account or email to continure us', style: TextStyle(color: AppColors.textWelcom),)],),
              SizedBox(height: 15,),
              SocialLoginButtons(
                onFacebookTap: controller.loginWithFacebook,
                onGoogleTap: controller.loginWithGoogle,
                onAppleTap: controller.loginWithApple
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 10),
                      child: Divider(
                        thickness: 1,
                        color: AppColors.leftDivider,
                      
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text('OR', style: TextStyle(color: AppColors.textOR, fontWeight: FontWeight.w500 ),),),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left:  10, right: 30),
                      child: Divider(color: AppColors.rightDivider, thickness: 1,)),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Your Email",
                          // hintText: "Enter Your email",
                          border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 223, 216, 216))),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 223, 216, 216))),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 223, 216, 216)))
                          
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Email is required";
                          }
                          if(!GetUtils.isEmail(value)){
                            return "Enter valid email";
                          }
                          return null;
                        },
                        onChanged: (_){
                          setState((){isFormValid = _formKey.currentState!.validate();});
                        }
                      
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: controller.passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 223, 216, 216))),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 223, 216, 216))),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 223, 216, 216)))
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Password is required";
                    }if(value.length < 6){
                      return "Minimum 6 characters";
                    }
                    return null;
                   },
                   onChanged: (_){
                    setState((){ isFormValid = _formKey.currentState!.validate();});
                   },
                
                ),
              ),
              Spacer(),
              //  SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: InkWell(onTap: isFormValid ? controller.login : null,
                child: Container(height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isFormValid
                  ? const Color.fromARGB(255, 15, 134, 124)
                  : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),),
                  child: Text("Log in", style: TextStyle(color: Colors.white),),)),
              ),
              SizedBox(height: 5,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: Text('Forgor Password', style: TextStyle(color: const Color.fromARGB(255, 15, 134, 124) ),))],
                ),
              
                
    

            ],
          ),
        ),),
      )
    );
  }
}