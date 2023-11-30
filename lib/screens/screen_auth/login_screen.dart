import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/block/user_provider.dart';
import 'package:project_app/common_widget/customeFomFile.dart';
import 'package:project_app/common_widget/footer_auth.dart';
import 'package:project_app/common_widget/page_header.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }

}
class _LoginState extends State<Login>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingControllerEmail = TextEditingController();
  TextEditingController _textEditingControllerPassword = TextEditingController();
  bool show = false;
  void setShow(){
    setState(() {
      show = !show;
      print('run at here $show');
    });
  }
  String? validate(String value,String type){
    if(value == null || value.isEmpty){
      return 'Please enter your $type';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    Color yel = Theme.of(context).colorScheme.onSecondary;
    TextStyle? h4 = Theme.of(context).textTheme.headline4;
    TextStyle? sub = Theme.of(context).textTheme.headline4!.copyWith(color: yel);
    return  Scaffold(
      body:
      Consumer<UserProvide>(
        builder: (context, userProvider, child) =>
         SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
            [
              const AspectRatio(
                aspectRatio: 375/410,
                child: PageHeader(
                    title: 'Welcome back, Sarah',
                    image: 'https://res.cloudinary.com/dwu92ycra/image/upload/v1700476786/bg_login_oxejpc.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
                child: Form(
                  key: _formKey,
                    child:  Column(
                    children: [
                    CustomeTextFile(
                      lableText: 'Email',
                      textEditingController: _textEditingControllerEmail, type: 'email',),
                    CustomeTextFile(lableText: 'Password',
                      textEditingController:_textEditingControllerPassword ,
                      show: show,
                      fn: ()=>setShow(), type: 'password',
                    ),
                      const Align(
                        heightFactor: 1.5,
                        alignment: Alignment.bottomRight,
                        child: Text('Forgot password'),
                      )
                  ],
                )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: FooterAuth(
                    fn1: (){},
                    fn2: (){},
                    fn3: (){userProvider.login(
                        _textEditingControllerEmail.text,
                        _textEditingControllerPassword.text, context);},
                    titleButton: 'Login'),
              )
            ],
          ),
        ),
      ) ,
    );
  }

}