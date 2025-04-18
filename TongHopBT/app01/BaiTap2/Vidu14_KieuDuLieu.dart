void main(){
  //int: là kiểu số nguyên
  int x = 100;

  //double: là kiểu số thực
  double y = 100.5;

  //num: có thể chứa số nguyên hoặc chứa số thực
  num z = 10;
  num t = 10.75;

  //chuyển chuỗi sang số nguyên
  var one = int.parse('1');
  print(one==1?'True':'false');

  //chuyển chuổi sang số thức
  var OnePointOne = double.parse('1.1');
  print(OnePointOne==1.1);

  //Số thực -> chuỗi
  String piAsString = 3.14159.toStringAsFixed(2);
  print(piAsString);
}