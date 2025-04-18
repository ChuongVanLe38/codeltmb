import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget{
  const MyButton2({super.key});

  @override
  Widget build(BuildContext context) {
    // tra ve Scaffold - widget cung cap bo cuc material design co ban
    //Man hinh
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


      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),

            ElevatedButton(
                onPressed: (){print("ElevatedButton");},
                child: Text("ElevatedButton", style:  TextStyle(fontSize: 24)),
                style:  ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                  ),
                  elevation: 5,
                ),
            ),
            SizedBox(height: 20,),

            OutlinedButton(
                onPressed: (){print("OutlineButton");},
                child: Text("OutlineButton", style:  TextStyle(fontSize: 24)),
                style:  OutlinedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 25
                  ),
                )
            ),

            SizedBox(height: 20,),

            InkWell(
              onTap: (){
                print("InkWell được nhấn");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tùy chỉnh với InWell"),
              ),
            )


          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){print("Pressed");},
        child: const Icon(Icons.add_ic_call),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm kiếm"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá nhân"),
      ]),

    );
  }


}