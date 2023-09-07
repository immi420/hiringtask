import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiringtask/src/common/rounded_button.dart';

import '../../navigation_bar/presentaion/bottom_navigation_bar.dart';
import '../domain/auth_provider.dart';
import 'register_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<LoginScreen> {
  bool _isObscure = true;
  bool loading = false;
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.08,
                    left: 50.0,
                    right: 50.0),
                child: Column(
                  children: [
                    const Text(
                      'LogIn',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Text(
                      'Login by entering your email and password',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: formGlobalKey,
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              child: Text(
                                'E-mail',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                autofocus: false,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                                decoration: InputDecoration(
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xff00094B),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Enter email',
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 20.0, top: 20.0),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == "") {
                                    return "Enter Password";
                                  }
                                  if (value!.length < 7) {
                                    return 'Password must be more than 6 character';
                                  }
                                  return null;
                                },
                                obscureText: _isObscure,
                                controller: _passwordController,
                                autofocus: false,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  //-----hide or show text icon------
                                  suffixIcon: IconButton(
                                      color: Colors.grey[400],
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 20.0, top: 20.0),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xff00094B),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Center(
                                child: RoundedButton(
                              onTap: () async {
                                if (formGlobalKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  final user = await auth.signIn(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (user != null) {
                                    // Navigate to the home screen
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => BottomNavBar(),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Authentication failed'),
                                      ),
                                    );
                                  }
                                }
                              },
                              loading: loading,
                              title: 'Login',
                            )),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text("OR")],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () async {
                                      setState(() {
                                        loading = true;
                                      });
                                      final user = await auth.googleSignIn();
                                      setState(() {
                                        loading = false;
                                      });
                                      if (user != null) {
                                        // Navigate to the home screen
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavBar(),
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content:
                                                Text('Authentication failed'),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: InkWell(
                                    child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(
                                        FontAwesomeIcons.apple,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Apple Login");
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Not have an account? Let's",
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black)),
                                  Text(" Sign Up",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff00094B),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
