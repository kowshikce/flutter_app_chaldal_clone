import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_chaldal_clone/screens/CartScreen.dart';
import 'package:flutter_app_chaldal_clone/screens/ProductDetailScreen.dart';
import './screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import './Providers/AuthProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFfdd670)));
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AuthProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Chaldal",
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFFfdd670),
            secondaryHeaderColor: Color(0xFFfdd670),
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            )),
        home: HomeScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartsScreen.routeName: (ctx) => CartsScreen(),
        },
      ),
    );
  }
}
