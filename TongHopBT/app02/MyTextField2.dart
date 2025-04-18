import 'package:flutter/material.dart';

class MyTextField2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField2> {
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Tieu de cua ung dung
      appBar: AppBar(
        //Tieu de
        title: Text("App 02"),

        //Mau nen
        backgroundColor: Colors.blue,

        //Do nang / do bong cua nen
        elevation: 4,

        actions: [
          IconButton(
            onPressed: (){print("b1");},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: (){print("b2");},
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: (){print("b3");},
            icon: Icon(Icons.more_vert),
          )
        ],

      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: Column(
                children: [
                  SizedBox(height: 50),

                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        labelText: "Nhập thông tin!",
                        hintText: "thông tin của bạn!",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: IconButton(
                            onPressed: (){
                              _textController.clear();
                            },
                            icon: Icon(Icons.clear)
                        )
                    ),
                    onChanged: (value){
                      setState(() {
                        _inputText = value;
                      });
                    },
                  ),

                  SizedBox(height: 50,),
                  Text('Bạn đã nhập: $_inputText', style: TextStyle(fontSize: 27),),
                ]
            )
        ),
      ),
    );
  }
}
