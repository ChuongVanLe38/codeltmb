import 'dart:io';

void main(){
  //Nhap ten nguoi dung
  stdout.write('Enter your name: ');
  String name = stdin.readLineSync()!;

  //Nhap tuoi nguoi dung
  stdout.write('Enter your age: ');
  int age = int.parse(stdin.readLineSync()!)!;

  print("Xin chào: $name, tuổi của bạn là: $age");
}