import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Products/ProductsUI.dart';
import '../constant.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

/*
╔════════════════════════════════════════════════════════════════════════════╗
║ A new version of Flutter is available!                                     ║
║                                                                            ║
║ To update to the latest version, run "flutter upgrade".                    ║
╚════════════════════════════════════════════════════════════════════════════╝

Launching lib\main.dart on SM A305F in debug mode...
Running Gradle task 'assembleDebug'...

* */
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var ResetpassController = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  bool isAbscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scaff = ScaffoldMessenger.of(context);
    return BlocProvider(
      create: (BuildContext context) => LoginCubit()..init(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState && state.status == 'success') {
            print('Success');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.status.toString()),
            ));
            Navigator.pushReplacementNamed(context, 'home');
          }
          if(state is LoginSuccessState && state.status != 'success' ){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.status.toString()),
            ));
          }
          if (state is LoginErrorState) {
            print('Error');
          }
        },
        builder: (context, state) {
          print(size.width);
          print(size.height);
          return Scaffold(
            key: Scaffoldkey,
            body: SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(
                          left: 39,
                          top: 89,
                          right:size.width<=400?185 :171,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            fontSize:size.width<=400? 40:70,
                            fontFamily: 'roboto',
                            color: Color(0xFF1d2226),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 39,
                          right: 112,
                          bottom: 51,
                          top: 13,
                          //bottom: size.height * 0.0623,
                        ),
                        child: Text(
                          "Please login to your account.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1d2226),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 38,
                          //top: 240,
                          right: 37,
                          bottom: 18,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            labelText: 'Email',
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 38,
                          //top: size.width * 0.0308,
                          right: 37,
                          bottom: 51,
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  isAbscure
                                      ? isAbscure = LoginCubit.get(context)
                                          .ChangeBool(isAbscure, false)
                                      : isAbscure = LoginCubit.get(context)
                                          .ChangeBool(isAbscure, true);
                                },
                                child: isAbscure
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            prefixIcon: const Icon(
                              Icons.lock,
                              // color: Colors.teal,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            labelText: 'Password',
                          ),
                          controller: passController,
                          obscureText: isAbscure,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'the password must not be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 38,
                          right: 37,
                        ),
                        child: MaterialButton(
                          color: const Color(0xFF1a1a1a),
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          minWidth: double.infinity,
                          onPressed: () {
                            LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Color(0xFFffffff),
                              fontWeight: FontWeight.w300,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.only(
                          left: 227,
                         // right: 38,
                          top: 20,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Forgot password ?",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF1a1a1a),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 155,
                          right: 155,
                          top: 65,
                        ),
                        child: Text(
                          "or Login with",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9d9d9d),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'G',
                              style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'f',
                              style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              'T',
                              style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 81,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1a1a1a),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Create new now!',
                              style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "By signing up, you are agree with our ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1a1a1a),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                  color: Color(0xFF1a1a1a),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 47,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
