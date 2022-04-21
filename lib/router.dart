import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:null_check_operator_used_on_null_value/Products/ProductsUI.dart';
import 'package:null_check_operator_used_on_null_value/login/login_screen.dart';

class Flurorouter {
  static final router = FluroRouter();
  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          LoginScreen());
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          ProductUI());

  static void setupRouter() {
    router.define(
      'login',
      handler: _loginHandler,
    );
    router.define(
      'home',
      handler: _homeHandler,
    );
  }
}
