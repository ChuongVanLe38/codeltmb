/*
Record là 1 kiểu dữ liệu tổng hợp
*/
void main(){
  var r = ('First',a:2, 5, 10.5);//Record

  //Dinh nghia record co 2 gia tri
  var point = (123,456);

  //Dinh nghia persom
  var person = (name:'Alice', age: 25,5);

  //Truy cập giá trong record
  //Dùng chỉ số
  print(point.$1);//123
  print(point.$2);//456
  print(person.$1);//456
  print(point.first);//123
  //Dùng tên
  print(person.name);
  print(person.age);
  
}