import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social/api/Login.dart';
import 'package:social/binding/UserProfileBinding.dart';
import 'package:social/controller/FollowingController.dart';
import 'package:social/db/SettingDBProvider.dart';
import 'package:social/model/ServerMe.dart';
import 'package:social/model/User.dart';
import 'package:social/page/HomePage.dart';
import 'package:social/page/LoginPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<Map<dynamic, dynamic>>("following");
  UserProfileBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _dbProvider = SettingDBProvider();
  FollowingController followingController = Get.find<FollowingController>();
  late Widget progress;

  @override
  Widget build(BuildContext context) {
    initWidget();
    return HomePage();
    // checkTokenExpire();
    // return FutureBuilder<ServerMe>(
    //   future: getMe(_dbProvider.getSettings().token),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       switch (snapshot.data!.code) {
    //         case 200:
    //           return HomePage();
    //         case 401:
    //           return LoginPage();
    //         default:
    //           return LoginPage();
    //       }
    //     }
    //     return progress;
    //   },
    // );
  }

  void initWidget() {
    progress = Scaffold(
      appBar: AppBar(
        title: const Text("Social"),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkTokenExpire() {
    if (checkExpire()) {
      refresh(_dbProvider.getSettings().token).then((value) {
        if (value.code == 200) {
          _dbProvider.updateSetting(
              SettingDBProvider.TOKEN_SETTING, value.accessToken);
          if (value.tokenExpire != null) {
            int now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
            int expire = value.tokenExpire!;
            _dbProvider.updateTokenExpire(now + expire);
          }
        }
      });
    }
  }

  bool checkExpire() {
    if (_dbProvider.getSettings().tokenExpire != 0) {
      if (_dbProvider.getSettings().tokenExpire <
          (DateTime.now().millisecondsSinceEpoch / 1000).round()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
