import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void printSomething() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(10),
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: CircularProgressIndicator(color: Colors.red),
          ),
        );
      },
    );
    Future.delayed(Duration(seconds: 5), () {
      print('Hello World');
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            // mainAxisExtent: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 50,
          //   mainAxisSpacing: 20,
          //   childAspectRatio: 1 / 100,
          //   crossAxisSpacing: 20,
          // ),
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(milliseconds: 2500),
                    action: SnackBarAction(label: 'Undo', onPressed: () {}),
                    content: Text('Hello, I am Snack Bar'),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                width: 300,
                height: 300,
                child: Center(child: Text('SnackBar')),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      icon: Icon(Icons.warning, color: Colors.red),
                      title: Text('Warning'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                      content: Text('I am Alert Dialog'),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.black,
                width: 300,
                height: 300,
                child: Center(
                  child: Text(
                    'Basic Alert Dialog',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showCupertinoDialog(
                  context: context,

                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('Warning'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                      content: Text('Hello, I am Alert Dialog'),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.black,
                width: 300,
                height: 300,
                child: Center(
                  child: Text(
                    'Cupertino Alert Dialog',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showBottomSheet(
                  enableDrag: false,
                  constraints: BoxConstraints(
                    maxHeight: 500,
                    maxWidth: double.infinity,
                  ),
                  backgroundColor: Colors.green,
                  context: context,
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                color: Colors.yellow,
                width: 300,
                height: 300,
                child: Center(child: Text('Bottom Sheet')),
              ),
            ),
            GestureDetector(
              onTap: () {
                printSomething();
              },
              child: Container(
                color: Colors.blue,
                width: 300,
                height: 300,
                child: Center(child: Text('Circular Progress Indicator')),
              ),
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      cancelButton: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                      title: Text('Select an Option'),
                      message: Container(width: double.infinity, height: 700),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Next'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Previous'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                color: Colors.grey,
                width: 300,
                height: 300,
                child: Center(child: Text('Cupertino Sheet')),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(color: Colors.indigo, width: 300, height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
