import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final Map<String, dynamic> userInfo = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvide>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: FutureBuilder(
          future: userProvider.getUserInfo('userInfo'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> dataUser = snapshot.data!;
              print('check $dataUser');
              final TextEditingController textEditingControllerName =
                  TextEditingController(text: dataUser['nickname'] ?? '');
              final TextEditingController textEditingControllerEmail =
                  TextEditingController(text: dataUser['email'] ?? '');
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white12.withOpacity(0.25),
                          ),
                          child: Center(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "EDIT PROFILE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          const Image(
                              image: AssetImage('assets/images/avatar_01.png')),
                          Positioned(
                            bottom: 4,
                            right: 4,
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white12.withOpacity(0.25),
                              ),
                              child: Center(
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: const Icon(
                                    Icons.camera_alt_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 0.5,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 58, 58, 60),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: textEditingControllerName,
                            decoration: const InputDecoration(hintText: ''),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 0.5,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 58, 58, 60),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 15,
                            ),
                          ),
                          TextFormField(
                            controller: textEditingControllerEmail,
                            decoration: const InputDecoration(hintText: ''),
                          ),
                          // TextFormField(),
                        ],
                      ),
                    ),
                    Container(
                      height: 0.5,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 58, 58, 60),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () => {
                          userProvider.changeInfoUser({
                            "id": dataUser['id'],
                            "nickname": textEditingControllerName.text,
                            "email": textEditingControllerEmail.text
                          })
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 208, 253, 62),
                          ),
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )),
      ),
    );
  }
}
