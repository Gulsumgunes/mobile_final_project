import 'package:flutter/material.dart';
import 'HomeScreen.dart';


// ignore: use_key_in_widget_constructors
class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signUp(BuildContext context) {
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    // ignore: unused_local_variable
    String password = _passwordController.text;

    // Burada email, username ve password kullanarak yeni bir kullanıcı kaydı yapabilirsiniz.
    // Kayıt işlemlerini uygulamanıza uygun bir şekilde gerçekleştirmeniz gerekecektir.

    // Örnek olarak, kayıt başarılı olduğunda Ana Akış ekranına yönlendirilebilir.
    User newUser = User(username: username, email: email, imageUrl: '');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(user: newUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.black), // Email metin rengi
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Alt çizgi rengi
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black), // Email metin rengi
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Alt çizgi rengi
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black), // Email metin rengi
                border: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Alt çizgi rengi
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 32, 85, 150),
              ),
              onPressed: () => _signUp(context),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
