import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';
import '../providers/client_provider.dart';

import '../screens/main_menu_screen.dart';

import '../helpers/toasts.dart';

import '../widgets/no_internet_connection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _connection = false;

  @override
  void initState() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      setState(() {
        _connection = status == InternetConnectionStatus.connected;
      });
    });
    super.initState();
  }

  OtpTimerButtonController otpController = OtpTimerButtonController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController otpNumberController = TextEditingController();

  _requestOtp() async {
    bool getClient = await Provider.of<ClientProvider>(context, listen: false)
        .getCode(usernameController.text, contactController.text);
    if (getClient) {
      otpController.loading();
      Future.delayed(const Duration(seconds: 3), () {
        otpController.startTimer();
        Provider.of<ClientProvider>(context, listen: false)
            .sendOtp(contactController.text);
      });
    } else {
      Fluttertoast.showToast(msg: 'Unknown user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _connection
        ? loginWidget(context)
        : noInternetConnectionWidget(context);
  }

  Widget loginWidget(context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to exit'),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(Provider.of<ThemeProvider>(context).background),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Welcome!\nYour health matters with us.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: contactController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      suffixIcon: OtpTimerButton(
                        text: const Text(
                          'Send',
                        ),
                        buttonType: ButtonType.text_button,
                        controller: otpController,
                        duration: 120,
                        onPressed: () {
                          _requestOtp();
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: otpNumberController,
                    decoration: const InputDecoration(
                      labelText: 'OTP',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    // onPressed: () {
                    //   Navigator.pushReplacementNamed(
                    //       context, mainMenuScreenRoute);
                    // },
                    onPressed: () async {
                      if (usernameController.text.isNotEmpty &&
                          contactController.text.isNotEmpty &&
                          otpNumberController.text.isNotEmpty) {
                        bool response = await Provider.of<ClientProvider>(
                                context,
                                listen: false)
                            .loginClient(
                                usernameController.text,
                                contactController.text,
                                otpNumberController.text);
                        if (response) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainMenuScreen(
                                      hasConnection: _connection)));
                        } else {
                          Fluttertoast.showToast(msg: 'Incorrect OTP');
                        }
                      } else {
                        Toasts.showErrorFieldToast();
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'New User? Create an Account',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  onTap: () async {
                    final response = await Navigator.pushNamed(
                        context, registrationScreenRoute);
                    if (response == true) {
                      Fluttertoast.showToast(
                          msg: 'Registration completed successfully');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
