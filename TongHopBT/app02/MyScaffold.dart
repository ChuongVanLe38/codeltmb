import 'package:flutter/material.dart';

class MyScafffold extends StatelessWidget{
    const MyScafffold({super.key});

  @override
  Widget build(BuildContext context) {
    // tra ve Scaffold - widget cung cap bo cuc material design co ban
    //Man hinh
    return Scaffold(
      //Tieu de cua ung dung
      appBar: AppBar(
        title: Text("App 02"),
      ),

      backgroundColor: Colors.amberAccent,
      
      body: Center(child: Text("Nội dung chính"),),
      
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