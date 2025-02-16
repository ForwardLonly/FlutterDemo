import 'package:flutter/material.dart';

class FormDemo  extends StatelessWidget {
  const FormDemo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           RegisterForm()
        ],
      ),
    );
  }
}

// 登录注册的表单的Demo
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  String userName ="", passWord = "";
  AutovalidateMode _validateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey, 
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username'
            ),
            onSaved: (value){
              if (value == null) {
                print("userNmae is null");
              } else {
                print("onSaved: userNmae is $value");
                userName = value;
              }
            },
            validator: _validatorUserName,
            autovalidateMode: _validateMode,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password'
            ),
            onSaved: (value) {
              if (value == null) {
                print("password is null");
              } else {
                print("onSaved: passWord is $value");
                passWord = value;
              }
            },
            validator: _validatorPassword,
            autovalidateMode: _validateMode,
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: FloatingActionButton(
              onPressed: _submitRegisterForm,
              backgroundColor: Colors.blueAccent,
              child: Text('Register', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      )
    );
  }

  // 提交表单的事件
  void _submitRegisterForm() {

    if (_registerFormKey.currentState != null) {

      if (_registerFormKey.currentState!.validate()) {
        _registerFormKey.currentState?.save();
        print("userName = $userName");
        print("password = $passWord");

       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('正在注册中....')
          ),
        );
      } else {
         setState(() {
          _validateMode = AutovalidateMode.always;
        });
      }
    } 
      
  }

  // 验证用户名的表单
  String? _validatorUserName(String? value) {
    if (value == null || value.isEmpty) {
      return "Username is Required";
    } else {
      return null;
    }
  }

  // 验证密码的表单
  String? _validatorPassword(String? value) {
     if (value == null || value.isEmpty) {
      return "Password is Required";
    } else {
      return null;
    }
  }
}

// TextField 使用的demo
class TextFildDemo extends StatefulWidget {
  const TextFildDemo({super.key});

  @override
  State<TextFildDemo> createState() => _TextFildDemoState();
}

class _TextFildDemoState extends State<TextFildDemo> {

  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // 设置初始值
    textEditingController.text = "hi,zhuzhu";
    // 添加监听
    textEditingController.addListener((){
      print("inputValue: (${textEditingController.text})");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // 如果用了 controller 的属性，就不用 onChanged 的方法
      // onChanged: (value) {
      //   print("input value: $value");
      // },
      onSubmitted: (value){
        print("submit value: $value");
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: "Title",
        hintText: "Enter the post title.",
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.yellow
      )
    );
  }
}