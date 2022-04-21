import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_check_operator_used_on_null_value/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  Dio? dio;

  init() {
    print(5);
    dio = Dio(BaseOptions(
      baseUrl: 'http://restapi.adequateshop.com/',
    ));
  }

  userLogin({
    required String email,
    required String password,
  }) async {
    init();
    const PostUrl = 'http://restapi.adequateshop.com/api/authaccount/login';
    final headers = {
      "content-type": "application/json",
    };
    final data = {
      "email": email,
      "password": password,
    };
    await dio!
        .post(
      'api/authaccount/login',
      data: data,
      options: Options(
        headers: headers,
      ),
    )
        .then((value) {
      print(value);
      print(value.data['message']);
      print(value.statusMessage);
      emit(LoginSuccessState(value.data['message']));
    }).catchError((onError) {
      emit(LoginErrorState(onError.toString()));
      print(onError);
    });
  }

  bool ChangeBool(var c, var y) {
    emit(ChangePasswordVisibilityState());
    c = y;
    return c;
  }
}
