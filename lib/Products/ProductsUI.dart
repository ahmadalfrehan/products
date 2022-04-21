import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:null_check_operator_used_on_null_value/Products/Cubit/Cubit.dart';
import 'package:null_check_operator_used_on_null_value/Products/Cubit/States.dart';

import '../login/cubit/cubit.dart';
import '../login/cubit/states.dart';

class ProductUI extends StatelessWidget {
  ProductUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scaff = ScaffoldMessenger.of(context);
    return BlocProvider(
      create: (BuildContext context) => ProductCubit()
        ..init()
        ..getGategories(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<ProductCubit, ProductStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color(0xFF333742),
                  titleSpacing: 0,
                  actions: [
                    MaterialButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  title: MaterialButton(
                    onPressed: () {},
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ),
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: const Color(0xFF333742),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (state is ProductGetItemsLoadingState)
                                const LinearProgressIndicator(),
                              if (state is ProductGetCategoryLoadingState)
                                const LinearProgressIndicator(),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                height: 30,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: ProductCubit.get(context)
                                      .catergory
                                      .length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        ProductCubit.get(context)
                                            .ChangeIndex(index);
                                        ProductCubit.get(context).getItems(
                                          Category: ProductCubit.get(context)
                                              .catergory[index]
                                              .toString(),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(left: 15),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Text(
                                          ProductCubit.get(context)
                                              .catergory[index]
                                              .toString(),
                                          style: TextStyle(
                                            color: index ==
                                                    ProductCubit.get(context)
                                                        .Selected
                                                ? Colors.white
                                                : const Color(0xFF888c97),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount:
                                      ProductCubit.get(context).Items.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Color(0xFF454d5a),
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  ProductCubit.get(context)
                                                      .Items[index]['image'],
                                                  fit: BoxFit.contain,
                                                  height: 100,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    ProductCubit.get(context)
                                                        .Items[index]['title']
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '\$' +
                                                          ProductCubit.get(
                                                                  context)
                                                              .Items[index]
                                                                  ['price']
                                                              .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      ProductCubit.get(context)
                                                          .Items[index]
                                                              ['rating']
                                                              ['count']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          child: MaterialButton(
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Text(
                                                  ProductCubit.get(context)
                                                      .Items[index]['rating']
                                                          ['rate']
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            ),
                                            elevation: 0,
                                          ),
                                          alignment:
                                              AlignmentDirectional.topEnd,
                                        ),
                                        Align(
                                          child: MaterialButton(
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                            ),
                                            elevation: 0,
                                          ),
                                          alignment: Alignment.topRight,
                                        ),
                                        Align(
                                          child: MaterialButton(
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.shopping_cart_outlined,
                                              color: Colors.white,
                                            ),
                                            elevation: 0,
                                          ),
                                          alignment: Alignment.centerRight,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
