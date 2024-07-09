import 'package:car_dealer_app/models/auth_login_response.dart';
import 'package:car_dealer_app/networking/auth_service_api.dart';
import 'package:car_dealer_app/networking/storage_service.dart';
import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:car_dealer_app/theme/theme_custom_button.dart';
import 'package:car_dealer_app/theme/theme_custom_validator.dart';
import 'package:car_dealer_app/theme/theme_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _userIdCtrl = new TextEditingController();
  final FocusNode _userIdNode = FocusNode();
  final TextEditingController _pswrdCtrl = new TextEditingController();
  final FocusNode _pswrdNode = FocusNode();
  final GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading;
  bool isFirstLogin = true;
  bool isChecking = true;

  bool storeStatus = true;

  AuthService _authService = new AuthService() ;
  StorageService _storage = new StorageService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Stack(children: [
                  Image.asset(
                    "assets/images/login_bg.png",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/app_logo.png",
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, right: 16),
                      child: MyCustomButton(
                        height: 30,
                        width: 80,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'English',
                            style: gcTitleTextStyle,
                          ),
                        ),
                        onPressed: () {
                          // print('tapped');
                          // if (_globalKey.currentState.validate()) {
                          //   checkUserID();
                          //   //Navigator.pushNamed(context, '/mobileNo');
                          // } else {
                          //   print(_userIdCtrl.text);
                          //   print("Error Found");
                          // }
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email/Username',
                      style: appTextFieldTextStyle,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      color: Colors.white,
                      child: TextFormField(
                        controller: _userIdCtrl,
                        focusNode: _userIdNode,
                        validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          // border: new OutlineInputBorder(
                          //   borderSide: new BorderSide(
                          //     color: Colors.grey,
                          //   ),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54),

                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                            //  when the TextFormField in focused
                          ),
                          // hintText: 'enter email/username',
                          // hintStyle: gcPlaceholderTextStyle,
                        ),
                        onFieldSubmitted: (value) {},
                        // style: gcInputFieldTextStyle,
                      ),
                    ),
                    Text(
                      'Password',
                      style: appTextFieldTextStyle,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      color: Colors.white,
                      child: TextFormField(
                        controller: _pswrdCtrl,
                        focusNode: _pswrdNode,
                        validator: (value) => MyCustomValidator.validateIsEmpty(_userIdCtrl.text, 'userID', context),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          // border: new OutlineInputBorder(
                          //   borderSide: new BorderSide(
                          //     color: Colors.white,
                          //   ),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white54),
                            //  when the TextFormField in unfocused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange), //HexColor("#FF7300"
                            //  when the TextFormField in focused
                          ),
                          // hintText: 'enter email/username',
                          // hintStyle: gcPlaceholderTextStyle,
                        ),
                        onFieldSubmitted: (value) {},
                        // style: gcInputFieldTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    (isLoading == true)?CircularProgressIndicator():MyCustomButton(
                      height: 56,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: themeYellowColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Sign In', style: buttonTitleTextStyle),
                      ),
                      onPressed: () {
                        print('tapped');
                         _userIdNode.unfocus();
                        isLoading = true;
                         if (_globalKey.currentState.validate()) {

                           _authService.login(_userIdCtrl.text, _pswrdCtrl.text).then((response) {
                             setState(() {
                               isLoading = false;
                             });
                             AuthLoginResponse loginResponse = AuthLoginResponse.fromJson(response.data);
                             print(loginResponse);
                             _storage.set('access_token', loginResponse.accessToken).then((at) {
                               _storage.set('refresh_token', loginResponse.refreshToken).then((value) async {
                                 print(at);
                                 print(value);
                                 if (at) {
                                   isLoading = false;
                                   SharedPreferences prefs = await SharedPreferences.getInstance();
                                   String accessToken = prefs.get("access_token");
                                   print(accessToken);

                                   Navigator.pushNamed(context, '/tab');
                                 } else {
                                   print("something went wrong");
                                 }
                               });
                             });
                           }, onError: (e) {
                             setState(() {

                             });
                             print("something bad happened");

                           });

                         }

                        // checkUserID();
                        // Navigator.pushNamed(context, '/tab');

                        // if (_globalKey.currentState.validate()) {
                        //   // checkUserID();
                        //   //Navigator.pushNamed(context, '/mobileNo');
                        // } else {
                        //   print(_userIdCtrl.text);
                        //   print("Error Found");
                        // }
                      },
                    ),
                    FlatButton(
                      height: 32,
                      onPressed: () {},
                      child: Text(
                        'Forgot Password',
                        style: gcTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Or,',
                        style: appTextFieldTextStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 72,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: RaisedButton.icon(
                        icon: SvgPicture.asset('assets/icons/ic_google.svg'),
                        label: Text(
                          'CONTINUE WITH GOOGLE',
                          style: socialButtonTextStyle,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      height: 72,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: RaisedButton.icon(
                        icon: SvgPicture.asset('assets/icons/ic_fb.svg'),
                        label: Expanded(
                          child: Text(
                            'CONTINUE WITH FACEBOOK',
                            style: socialButtonTextStyle,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future checkUserID() {
    _authService.login(_userIdCtrl.text, _pswrdCtrl.text).then((response) {
      AuthLoginResponse loginResponse = AuthLoginResponse.fromJson(response.data);
      _storage.set('access_token', loginResponse.accessToken).then((at) {
        _storage.set('refresh_token', loginResponse.refreshToken).then((value) {
          print(at);
          print(value);
          if (at) {
            Navigator.pushNamed(context, '/tab');
          } else {
            print("something went wrong");
          }
        });
      });
    }, onError: (e) {
      setState(() {

      });
      print("something bad ha[ppened");

    });
  }
}
