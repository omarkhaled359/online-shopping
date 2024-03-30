import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/custom_widgets/custom_edit_text.dart';
import 'package:shopping/data/DataBase.dart';
import 'package:shopping/provider/ModelHub.dart';
import 'package:shopping/screens/home_screen.dart';
import 'package:shopping/screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});

  static String id = 'LoginScreen';
  late String _email, _password;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ModelHub model = Provider.of<ModelHub>(context);
    double padding = 0.0;
    if (width > height) padding = width / 2 - height / 4;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHub>(context).isLoading,
        child: Scaffold(
          backgroundColor: kMainColor,
          appBar: AppBar(
            backgroundColor: kMainColor,
            title: const Center(child: Text('WELCOME !')),
          ),
          body: ListView(
            children: [
              const Divider(color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      CustomEditText(
                          onSavedAction: (value) {
                            _email = value.toString();
                          },
                          title: "E_mail",
                          hint: "Enter your email"
                      ),
                      const SizedBox(height: 40),
                      CustomEditText(
                          onSavedAction: (value) {
                            _password = value.toString();
                          },
                          title: "Password",
                          hint: "Enter your password"
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                            ),
                            onPressed: (){},
                            child: const Text(
                              "Forget your password?",
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 14,
                                  color: blueTextColor
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: TextButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              backgroundColor: Colors.black,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            onPressed: () {
                              model.changeIsLoading(true);
                              if (_globalKey.currentState?.validate() == true) {
                                _globalKey.currentState?.save();
                                if (DataBase.customer.email == _email && DataBase.customer.password == _password) {
                                  model.changeIsLoading(false);
                                  Navigator.pushNamed(context, HomeScreen.id);
                                }
                                else {
                                  model.changeIsLoading(false);
                                  Fluttertoast.showToast(
                                    msg: 'Wrong credentials',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                  );
                                }
                              }
                              model.changeIsLoading(false);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 25,
                                  color: whiteTextColor
                              ),
                            )
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: TextButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            onPressed: (){
                              Navigator.pushNamed(context, SignUpScreen.id);
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 25,
                                  color: blackTextColor
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}