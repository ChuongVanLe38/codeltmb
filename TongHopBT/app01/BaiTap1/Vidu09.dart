void main(){
  Object obj ='Hello';

  //Kiem tra obj có phải string 
  if(obj is String){
    print('obj la 1 chuoi');
  }

  //Kiem tra obj không phải int
  if(obj is! int){
    print('obj khong phai la so nguyen');
  }

  //Ep Kieu
  String str = obj as String;
  print(str.toUpperCase());
}