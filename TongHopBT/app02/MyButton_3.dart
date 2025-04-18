import 'package:flutter/material.dart';

class MyButton3 extends StatelessWidget{
  const MyButton3({super.key});

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

            //Khóa button
            ElevatedButton(
                onPressed: null,//Khóa lại
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
            SizedBox(height: 50,),

            ElevatedButton(
              onPressed: (){print("Pressed");},
              onLongPress:(){print("Long Pressed");} ,
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
            SizedBox(height: 50,),

            InkWell(
              onTap: (){
                print("InkWell được nhấn");
              },
              onDoubleTap: () {
                print("InkWell được nhấn 2 lần liên tiếp");
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
            ),


            SizedBox(height: 50,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              label: Text("Yêu thích"),
            ),

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