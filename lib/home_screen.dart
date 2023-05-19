import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Language'),
        actions: [
          Switch(value: isDark, onChanged: (isOn) {
            setState(() {
              isDark = isOn;
            });
            changeTheme(isDark);
          }),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              OutlinedButton(onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
              }, child: const Text('English')),
              const SizedBox(width: 20),
              OutlinedButton(onPressed: () {
                Get.updateLocale(const Locale('hn', 'IN'));
              }, child: const Text('Hindi')),
            ],
          )
        ],
      ),
    );
  }

  void changeTheme(isDark){
    if(isDark == true){
      Get.changeTheme(ThemeData.dark());
    }else{
      Get.changeTheme(ThemeData.light());
    }
  }
}
