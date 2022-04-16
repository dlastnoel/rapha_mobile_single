import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';
import '../providers/client_provider.dart';

import '../widgets/dialogs.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  OtpTimerButtonController otpController = OtpTimerButtonController();
  final _usernameController = TextEditingController();
  final _contactController = TextEditingController();
  bool _isUsernameAccepted = false;
  bool _confirmButtonEnabled = false;
  bool _isPhoneConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Provider.of<ThemeProvider>(context).background),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text(
                  'Welcome!\nRegister an account below.',
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
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  controller: _usernameController,
                  onChanged: (String username) {
                    if (username.isNotEmpty) {
                      setState(() {
                        _isUsernameAccepted = true;
                      });
                    } else {
                      _isUsernameAccepted = false;
                    }
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _contactController,
                  onChanged: (String contact) {
                    if (contact.length == 11 && _isUsernameAccepted == true) {
                      setState(() {
                        _confirmButtonEnabled = true;
                      });
                    } else {
                      setState(() {
                        _confirmButtonEnabled = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    suffixIcon: TextButton(
                      child: const Text('Confirm Here'),
                      onPressed: _confirmButtonEnabled == true
                          ? () async {
                              final response = await Navigator.pushNamed(
                                  context, numberRegistrationScreenRoute);
                              if (response == true) {
                                setState(() {
                                  _isPhoneConfirmed = true;
                                });
                                Fluttertoast.showToast(
                                    msg: 'Phone number confirmed successfully');
                              }
                            }
                          : null,
                    ),
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
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        _isPhoneConfirmed ? Colors.blue : Colors.grey,
                  ),
                  onPressed: _isPhoneConfirmed
                      ? () {
                          registrationDialog(context, _usernameController.text,
                              _contactController.text);
                        }
                      : null,
                ),
              ),
              const SizedBox(
                height: 130,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
