import 'package:events_app/compoments/button.dart';
import 'package:events_app/compoments/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _profileNameController = TextEditingController();
  final storage = GetStorage();
  static const String key = 'profileName';
  late String profileName = 'Hung Ngo';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNameController.text =
        storage.read(key) != null ? storage.read(key) : 'Hung Ngo';
    profileName = storage.read(key) != null ? storage.read(key) : 'Hung Ngo';
    storage.listenKey(key, (value) {
      setState(() {
        profileName = value;
      });
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   storage.erase();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 64),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(children: [
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.edit),
                          ),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          profileName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: InputField(
                                height: 50,
                                controller: _profileNameController,
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    storage.write(
                                        key, _profileNameController.text);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Color.fromRGBO(51, 53, 56, 1),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text("nqhung@tma.com.vn")
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Primary City"), Text("Quy Nhon")],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Copy Event to calendar"),
                    CupertinoSwitch(
                      onChanged: (bool value) {},
                      value: true,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Events"),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Manage Events"),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Account Settingd"),
                    Icon(Icons.keyboard_arrow_right)
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonCommon(
                textButton: "Logout",
                onPress: () {},
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
