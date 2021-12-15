import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> with TickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();
  static late AnimationController animationController;

  static const int TIME = 1;

  bool isCheckedPasswrod = false;
  bool isCheckedLogin = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
    super.initState();
  }

  static Route<Object> _dialogBuilder(BuildContext context, Object? arguments) {
    return DialogRoute(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("登入中...."),
          // content: CircularProgressIndicator(
          //   value: animationController.value,
          // ),
        );
      },
    );
  }

  bool _showPassword = false;

  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Test'),
      ),
      body: Column(
        children: [
          const Text("T_T", textScaleFactor: 10.0),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: '用户名',
              hintText: '用户名或邮箱',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value) => print("onChang: $value"),
          ),
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: '密码',
              hintText: '你的登录密码',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: isCheckedPasswrod,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedPasswrod = value!;
                    });
                  }),
              const Text('记住密码'),
              Checkbox(
                  value: isCheckedLogin,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheckedLogin = value!;
                    });
                  }),
              const Text('自动登陆'),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('/a');
                      // Navigator.of(context).pop(context);
                      Future.delayed(const Duration(seconds: TIME), () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed('/home');
                      });
                      Navigator.of(context).restorablePush(_dialogBuilder);
                    },
                    child: const Text('登录')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
