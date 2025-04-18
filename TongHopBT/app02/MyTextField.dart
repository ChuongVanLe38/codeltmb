import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  const MyTextField({super.key});

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


      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0
          ),
        child:  Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và Tên",
                  hintText: "Nhập vào họ và Tên của bạn",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 50,),

              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Example@gmail.com",
                  helperText: "Nhập vào Email cá nhân",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  filled: true,
                  fillColor: Colors.greenAccent
                ),
                keyboardType: TextInputType.emailAddress,
              ),


              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "Nhập vào SĐT của bạn",
                  border: OutlineInputBorder()
                ),
                keyboardType:  TextInputType.phone,
              ),


              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    hintText: "Nhập Ngày sinh",
                    border: OutlineInputBorder()
                ),
                keyboardType:  TextInputType.datetime,
              ),

              SizedBox(height: 50,),
              TextField(
                decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder()
                ),
                keyboardType:  TextInputType.datetime,
                obscureText: true,
                obscuringCharacter: '*',
              ),

              SizedBox(height: 50,),
              TextField(
                onChanged: (value){
                  print("Đang nhập: $value");
                },
                onSubmitted: (value){
                  print("Đã hoàn thành nội dung: $value");
                },
                decoration: InputDecoration(
                    labelText: "Câu hỏi bí mật",
                    border: OutlineInputBorder()
                ),
                keyboardType:  TextInputType.datetime,
              ),


            ],
          ),
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