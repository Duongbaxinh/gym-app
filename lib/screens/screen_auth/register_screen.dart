
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/customeFomFile.dart';
import 'package:project_app/common_widget/footer_auth.dart';
import 'package:project_app/common_widget/page_header.dart';
import 'package:project_app/screens/screen_infor/gender_screen.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerNickName =
      TextEditingController();
  TextEditingController _textEditingControllerPassword =
      TextEditingController();
  TextEditingController _textEditingControllerAgainPassword =
      TextEditingController();
  String bg =
      'https://res.cloudinary.com/dwu92ycra/image/upload/v1700656153/Gym-app/bg_register_mjup81.png';
  bool show = false;
  void setShow() {
    setState(() {
      show = !show;
      print('run at here $show');
    });
  }

  String? validate(String value, String type) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $type';
    }
    if (type == 'again') {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color yel = Theme.of(context).colorScheme.onSecondary;
    TextStyle? h4 = Theme.of(context).textTheme.headline4;
    TextStyle? sub =
        Theme.of(context).textTheme.headline4!.copyWith(color: yel);
    return Scaffold(
      body: Consumer<UserProvide>(
        builder: (context, userProvider, child) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AspectRatio(
                aspectRatio: 375 / 350,
                child: PageHeader(
                    title: 'Hello rookies',
                    // sub: 'Enter your informations below or login with a other account',
                    image: bg),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFile(
                          lableText: 'Email',
                          textEditingController: _textEditingControllerEmail,
                          type: 'email',
                        ),
                        CustomTextFile(
                          lableText: 'NickName',
                          textEditingController: _textEditingControllerNickName,
                          type: 'nickname',
                        ),
                        CustomTextFile(
                          lableText: 'Password',
                          textEditingController: _textEditingControllerPassword,
                          show: show,
                          fn: () => setShow(),
                          type: 'password',
                        ),
                        CustomTextFile(
                          lableText: 'Again password',
                          compare: _textEditingControllerPassword.text,
                          textEditingController:
                              _textEditingControllerAgainPassword,
                          show: show,
                          fn: () => setShow(),
                          type: 'again_password',
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: FooterAuth(
                    fn1: () {},
                    fn2: () {},
                    fn3: () {
                      bool check = _formKey.currentState!.validate();
                      if (check) {
                        userProvider.setInfoUser(
                            'email', _textEditingControllerEmail.text);
                        userProvider.setInfoUser(
                            'password', _textEditingControllerPassword.text);
                        userProvider.setInfoUser(
                            'nickname', _textEditingControllerNickName.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Gender(),
                            ));
                      }
                    },
                    titleButton: 'Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
