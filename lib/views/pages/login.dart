import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UsernameCnt = TextEditingController();
  final PassCnt = TextEditingController();
  final formkey = GlobalKey<FormState>();

  


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
