import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
              'Enter Your email and we will send your password resend link',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),

          ),
        ),],
      ) ,
    );
  }}
     /* Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: _emailcontroller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: Colors.deepOrangeAccent,
              ),

                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                  BorderSide(color: Colors.white, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),),

                  BorderSide(color: Colors.pink, width: 1.0)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
        MaterialButton(onPressed: () {},
        child: Text('Resend password'),
        color: Colors.pink[100],),
      ],
      ) ,
    );
  }
}
*/