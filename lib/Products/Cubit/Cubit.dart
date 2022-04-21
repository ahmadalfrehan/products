import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_check_operator_used_on_null_value/Products/Cubit/States.dart';
import 'package:null_check_operator_used_on_null_value/login/cubit/states.dart';

import '../Models/Product.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  static ProductCubit get(context) => BlocProvider.of(context);
  Dio? dio;

  init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  List catergory = [];

  void getGategories() async {
    emit(ProductGetCategoryLoadingState());
    init();
    await dio!.get('products/categories').then((value) {
      emit(ProductGetCategorySuccessState());
      print(value.toString());
      catergory = value.data;
      print('the category is ' + catergory.toString());
    }).catchError((onError) {
      print(onError);
      emit(ProductGetCategoryErrorState());
    });
  }

  List Items = [];

  void getItems({required String Category}) async {
    emit(ProductGetItemsLoadingState());
    init();
    await dio!.get('products/category/${Category}').then((value) {
      emit(ProductGetItemsSuccessState());
      print(value.toString());
      Items = value.data;
      print('the category is ' + Items.toString());
    }).catchError((onError) {
      print(onError);
      emit(ProductGetItemsErrorState());
    });
  }

  int Selected = 0;

  void ChangeIndex(index) {
    emit(ProductChangeIndexSuccessState());
    Selected = index;
  }
}
