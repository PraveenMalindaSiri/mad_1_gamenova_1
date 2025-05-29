import 'package:flutter/material.dart';
import 'package:mad_1_gamenova_1/views/pages/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final UsernameCnt = TextEditingController();
  final NameCnt = TextEditingController();
  final EmailCnt = TextEditingController();
  final AgeCnt = TextEditingController();
  final PassCnt = TextEditingController();
  String? $success;

  final formkey = GlobalKey<FormState>();

  Widget _buildForm(context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          // username
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: UsernameCnt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please fill the Username corectly.");
                }
                if (value.length < 6) {
                  return ("Username should have at least 6 letters");
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),

          // password
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: PassCnt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please fill the Password corectly.");
                }
                if (value.length < 8) {
                  return ("Password should have at least 8 letters");
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),

          // fullname
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: NameCnt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please fill the Full Name corectly.");
                }
                if (value.length < 9) {
                  return ("Full Name should have at least 10 letters");
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Fullname",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),

          // email
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: EmailCnt,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please fill the Email corectly.");
                }
                if (value.length < 9) {
                  return ("Email should have at least 10 letters");
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Please enter a valid email address.";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),

          // age
          SizedBox(
            width: 500,
            child: TextFormField(
              controller: AgeCnt,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please fill the Age corectly.");
                }

                final age = int.tryParse(value);

                if (age == null) {
                  return ("Age must be a number.");
                }
                if (age < 9) {
                  return ("Age must be higher than 9.");
                }

                return null;
              },
              decoration: InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),

          // button
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                setState(() {
                  $success =
                      "'${NameCnt.text}' registered as '${UsernameCnt.text}' successfully";
                });
              }
            },
            child: Text(
              'REGISTER',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),

          Padding(padding: EdgeInsets.only(bottom: 10)),
          if ($success != null)
            Text(
              $success!,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

          Padding(padding: EdgeInsets.only(bottom: 10)),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('Try Log in'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildForm(context)],
          ),
        ),
      ),
    );
  }
}
