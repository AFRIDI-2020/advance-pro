import 'package:advance_pro/functions/custom_size.dart';
import 'package:advance_pro/providers/auth_provider.dart';
import 'package:advance_pro/screens/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _usernameErrorText;
  String? _passwordErrorText;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _bodyUI(authProvider),
      ),
    );
  }

  Widget _bodyUI(AuthProvider authProvider) => Padding(
        padding: EdgeInsets.all(customSize(context, .04)),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Advance Pro',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: customSize(context, .1),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: customSize(context, .1),
              ),

              /// username text field
              _customTextFormField('Username', _usernameErrorText, _usernameController),
              SizedBox(
                height: customSize(context, .04),
              ),

              /// password text field
              _customTextFormField('Password', _passwordErrorText, _passwordController),
              SizedBox(
                height: customSize(context, .04),
              ),

              /// login button
              SizedBox(
                width: double.infinity,
                height: customSize(context, .14),
                child: _isLoading? const Center(child: CircularProgressIndicator()) :  ElevatedButton(
                    onPressed: () {
                      if(_usernameController.text == ''){
                        setState(() => _usernameErrorText = 'Username is required!');
                        return;
                      }else{
                        setState(() => _usernameErrorText = null);
                      }
                      if(_passwordController.text == ''){
                        setState(() => _passwordErrorText = 'Password is required!');
                        return;
                      }else{
                        setState(() => _passwordErrorText = null);
                      }
                      login(_usernameController.text, _passwordController.text, authProvider);
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: customSize(context, .05),
                          fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
        ),
      );


  /// login function
  void login(String username, String password, AuthProvider authProvider) async {
    Map<dynamic, dynamic> data = {
      "username": username,
      "password": password,
      "twoFactorCode": null
    };
    setState(() => _isLoading = true);
    await authProvider.login(data).then((value){
      if(authProvider.successLogin){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ProductListPage()), (route) => false);
      }
    });
    setState(() => _isLoading = false);
  }

  /// custom text field
  Widget _customTextFormField(String labelText, String? errorText, TextEditingController textEditingController) =>
      TextFormField(
        controller: textEditingController,
        cursorColor: Colors.black,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: customSize(context, .03),
              vertical: customSize(context, .02)),
          errorText: errorText,
          labelText: labelText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(customSize(context, .02)),
              borderSide: const BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(customSize(context, .02)),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(customSize(context, .02)),
              borderSide: const BorderSide(color: Colors.grey)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(customSize(context, .02)),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      );
}
