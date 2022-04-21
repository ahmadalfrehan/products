import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:null_check_operator_used_on_null_value/login/login_screen.dart';
import 'package:null_check_operator_used_on_null_value/router.dart';

import 'package:rxdart/rxdart.dart';

import 'main.dart';
import 'main.dart';

/// generate n-amount of fibonacci numbers
///
/// for example: dart fibonacci.dart 10
/// outputs:
/// 1: 1
/// 2: 1
/// 3: 2
/// 4: 3
/// 5: 5
/// 6: 8
/// 7: 13
/// 8: 21
/// 9: 34
/// 10: 55
/// done!
/*void main(List<String> arguments) {
  var n = (arguments.length == 1) ? int.parse(arguments.first) : 10;
  const seed = IndexedPair(1, 1, 0);
  Rx.range(1, n)
      .scan((IndexedPair seq, _, __) => IndexedPair.next(seq), seed)
      .listen(print, onDone: () => print('done!'));
}
class IndexedPair {
  final int n1, n2, index;
  const IndexedPair(this.n1, this.n2, this.index);
  factory IndexedPair.next(IndexedPair prev) => IndexedPair(
      prev.n2, prev.index <= 1 ? prev.n1 : prev.n1 + prev.n2, prev.index + 1);
  @override
  String toString() => '$index: $n2';
}*/
void main() {
  Flurorouter.setupRouter();
  runApp(const MyApp());
}

final router = FluroRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluro Tutorial',
      initialRoute: 'login',
      onGenerateRoute: Flurorouter.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}
