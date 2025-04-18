/*
th1
expr1 ? expr2 : expr3;
Nếu expr1 đúng, trả về expr2; ngược lai, trả về expr3

th2
expr1 ?? expr2;
Nếu expr1 không null, trả về giá trị của nó;
ngược lại trả về expr2;

*/

void main(){
  var kiemTra = (100%2==0)?"100 là số chẵn":"100 là số lẻ";
  print(kiemTra);//th1

  var x =100;
  var y = x ?? 50;
  print(y);//th2

  int? z;

  y = z??30;
  print(y);//th2
}