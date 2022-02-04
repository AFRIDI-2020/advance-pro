import 'package:advance_pro/providers/auth_provider.dart';
import 'package:advance_pro/providers/product_provider.dart';
import 'package:advance_pro/screens/login_page.dart';
import 'package:advance_pro/screens/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _prefs = await SharedPreferences.getInstance();
  String? token =  _prefs.getString('token');
  runApp( MyApp(token: token,));
}

class MyApp extends StatelessWidget {
  String? token;
  MyApp({Key? key, required this.token}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: token == null? const LoginPage() : const ProductListPage(),
      ),
    );
  }
}
