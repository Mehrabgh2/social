import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social/api/Login.dart';
import 'package:social/binding/UserProfileBinding.dart';
import 'package:social/db/DBProvider.dart';
import 'package:social/model/ServerMe.dart';
import 'package:social/page/HomePage.dart';
import 'package:social/page/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: UserProfileBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _dbProvider = DBProvider();
  bool firstRun = true;
  final mainController = Get.put(MainController());
  late Widget progress;

  @override
  Widget build(BuildContext context) {
    initWidget();
    checkLogin();
    return FutureBuilder<ServerMe>(
      future: getMe(_dbProvider.getSettings().token),
      builder: (context, snapshot) {
        Widget page = progress;
        if (snapshot.hasData) {
          switch (snapshot.data!.code) {
            case 200:
              return HomePage();
            case 401:
              return LoginPage();
            default:
              return LoginPage();
          }
        }
        return page;
      },
    );
    // return Obx(() {
    //   return IndexedStack(
    //     children: pages,
    //     index: mainController.pageIndex.value,
    //   );
    // });
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

  void checkLogin() {
    if (checkExpire()) {
      refresh(_dbProvider.getSettings().token).then((value) {
        if (value.code == 200) {
          _dbProvider.updateSetting(
              DBProvider.TOKEN_SETTING, value.accessToken);
          if (value.tokenExpire != null) {
            int now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
            int expire = value.tokenExpire!;
            _dbProvider.updateTokenExpire(now + expire);
          }
          mainController.updatePageIndex(2);
        } else {
          mainController.updatePageIndex(1);
        }
      });
    } else {
      getMe(_dbProvider.getSettings().token).then((value) {
        if (value.code == 200) {
          mainController.updatePageIndex(2);
        } else {
          mainController.updatePageIndex(1);
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

  void _successLogin() {
    mainController.updatePageIndex(2);
  }

  void _successLogout() {
    mainController.updatePageIndex(1);
  }
}

class MainController extends GetxController {
  var pageIndex = 2.obs;

  updatePageIndex(int index) {
    pageIndex(index);
  }
}
