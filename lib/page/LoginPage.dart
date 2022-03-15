import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/api/Login.dart';
import 'package:social/db/SettingDBProvider.dart';
import 'package:social/page/HomePage.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _dbProvider = SettingDBProvider();
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
                if (usernameController.text == "" ||
                    passwordController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("fill the fields")));
                } else {
                  login(usernameController.text, passwordController.text).then(
                    (value) {
                      if (value.code == 401) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Wrong username or password")));
                      } else if (value.code == 200) {
                        _dbProvider.updateSetting(
                            SettingDBProvider.TOKEN_SETTING, value.accessToken);
                        if (value.tokenExpire != null) {
                          int now =
                              (DateTime.now().millisecondsSinceEpoch / 1000)
                                  .round();
                          int expire = value.tokenExpire!;
                          _dbProvider.updateTokenExpire(now + expire);
                        }
                        Get.offAll(HomePage());
                      }
                    },
                  );
                }
              },
              child: const Text("Login"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(size.height / 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
