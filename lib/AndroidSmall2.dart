
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'SignUpScreen.dart';


// ignore: use_key_in_widget_constructors

// ignore: use_key_in_widget_constructors
class AndroidSmall2 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AndroidSmall2State createState() => _AndroidSmall2State();
}

class _AndroidSmall2State extends State<AndroidSmall2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String getUsernameFromLoginForm(String value) {
    // Kullanıcı adını alacak işlemleri buraya ekleyin
    return value;
  }

  String getEmailFromLoginForm(String value) {
    // E-posta bilgisini alacak işlemleri buraya ekleyin
    return value;
  }

  void _login() {
    // Kullanıcı adını ve şifreyi al
    String usernameFromLogin =
        getUsernameFromLoginForm(_emailController.text.trim());
    String passwordFromLogin =
        getPasswordFromLoginForm(_passwordController.text);

    if (usernameFromLogin.isNotEmpty && passwordFromLogin.isNotEmpty) {
      // Kullanıcı nesnesini oluştururken kullanıcı adını ve şifreyi geçirin
      User loggedInUser = User(
        username: usernameFromLogin,
        email:
            '', // E-posta bilgisini girmek istemiyorsanız boş bırakabilirsiniz
        imageUrl: '',
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(user: loggedInUser),
        ),
      );
    } else {
      // ignore: avoid_print
      print('Username or password is empty');
    }
  }

  String getPasswordFromLoginForm(String value) {
    // Şifreyi alacak işlemleri buraya ekleyin
    return value;
  }

  void _signUp() {
    // SignUpScreen ekranına geçiş
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 360,
            height: 640,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                const Positioned(
                  left: 101,
                  top: 49,
                  child: Text(
                    'Login Now',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 85, 150),
                      fontSize: 32,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),

                Positioned(
                  left: 55,
                  top: 260,
                  child: Container(
                    width: 249,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 32, 85, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.transparent,
                        elevation: 0,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Ibarra Real Nova',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  top: 519,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 249,
                    height: 35,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 249,
                            height: 35,
                            decoration: ShapeDecoration(
                              color: const Color.fromARGB(255, 32, 85, 150),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 89,
                          top: 5,
                          child: GestureDetector(
                            onTap: _signUp,
                            child: const Text(
                              'Sign Up',
                              semanticsLabel: 'Sign Up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 186, 218, 230),
                                fontSize: 20,
                                fontFamily: 'Ibarra Real Nova',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 55,
                  top: 406,
                  child: Container(
                    width: 249,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.6200000047683716),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 59,
                  top: 132,
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),

                const Positioned(
                  left: 59,
                  top: 199,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                // Email input field
                Positioned(
                  left: 55,
                  top: 150,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 249,
                    height: 35,
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Ibarra Real Nova',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your email',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

                // Password input field
                Positioned(
                  left: 55,
                  top: 217,
                  child: SizedBox(
                    width: 249,
                    height: 35,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Ibarra Real Nova',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your password',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),

                const Positioned(
                  left: 107,
                  top: 472,
                  child: Text(
                    'Don’t have an account ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Ibarra Real Nova',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 95,
                  top: 361,
                  child: Container(
                    width: 16,
                    height: 16,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Stack(children: []),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
