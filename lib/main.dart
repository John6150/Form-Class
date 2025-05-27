import 'package:flutter/material.dart';
import 'package:myform/dashboard.dart';
import 'package:myform/variables.dart';
import 'package:myform/widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => MyHomePage(title: 'Form'),
        '/dashboard': (context) => Dashboard(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextInputWidget(
                control: nameController,
                hintText: "Name",
                labelWidget: Text('Name'),
                prefixIcn: Icon(Icons.account_circle),
              ),
              SizedBox(height: 20),
              TextInputWidget(
                control: emailController,
                hintText: "Email",
                labelWidget: Text('Email'),
                prefixIcn: Icon(Icons.mail),
              ),
              SizedBox(height: 20),

              PasswordWidget(
                control: passwordController,
                // suffixIcn: Icon(Icons.visibility),
                hintText: "Password",
                labelWidget: Text('Password'),
                prefixIcn: Icon(Icons.password),
              ),
              SizedBox(height: 20),
              PasswordWidget(
                control: confirmPasswordController,
                // suffixIcn: Icon(Icons.visibility),
                hintText: "Confirm Password",
                labelWidget: Text('Confirm Password'),
                prefixIcn: Icon(Icons.password),
              ),
              SizedBox(height: 20),
              ListTile(
                minLeadingWidth: double.infinity,
                minTileHeight: 40,
                textColor: Colors.red,
                leading: Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                ),

                title: Text('Male', style: TextStyle(color: Colors.black)),
              ),
              ListTile(
                minLeadingWidth: double.infinity,
                minTileHeight: 40,
                textColor: Colors.red,
                leading: Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                ),

                title: Text('Male', style: TextStyle(color: Colors.black)),
              ),
              // SizedBox(width: 40),
              // SizedBox(height: 5),
              // Dropdo
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/dashboard',
                      (route) => true,
                    );
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Dashboard()),
                    //   (Route<dynamic> route) => false,
                    // );
                  } else {
                    print('Not validated');
                  }
                },
                child: Text(
                  'Submit Form',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
