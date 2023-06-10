import 'package:first_project/enums/sized_box_enum.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late bool _isLoading;
  late bool _isOpacity;
  final SizedBoxEnum smallSizedBox = SizedBoxEnum.SMALL;
  final SizedBoxEnum mediumSizedBox = SizedBoxEnum.MEDIUM;
  final SizedBoxEnum largeSizedBox = SizedBoxEnum.LARGE;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _isOpacity = false;
    changeLoadingStatus();
  }

  Future<void> changeLoadingStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _isOpacity = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
          child: Column(
        children: [
          mediumSizedBox.showSizedBox,
          _isLoading
              ? AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  opacity: !_isOpacity ? 0 : 1,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/profile_image.jpeg"),
                    maxRadius: 100,
                  ),
                )
              : const CircularProgressIndicator(),
          largeSizedBox.showSizedBox,
          const Text("Gizem Ece Çetin"),
          smallSizedBox.showSizedBox,
          const Text("Ankara"),
        ],
      )),
    );
  }
}
