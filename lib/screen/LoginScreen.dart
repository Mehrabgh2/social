import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.width / 27),
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "username",
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: size.height / 27,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "password",
                icon: Icon(Icons.password),
              ),
            ),
            SizedBox(
              height: size.height / 27,
            ),
            ElevatedButton(
              onPressed: () {
                print(usernameController.text + passwordController.text);
              },
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(size.height / 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}
