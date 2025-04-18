//hàm với tên của tham số
String createFullName({String ho="Lê", String chuLot="Văn" , String ten="Chương"}){
  return ho+" "+chuLot+" "+ten;
}

//Tham số tùy chọn(Có hay không cũng được)
double sum(double a, [double? b, double? c, double? d]){
  var result = a;
  result+=(b!=null)?b:0;
  result+=(c!=null)?c:0;
  result+=(d!=null)?d:0;
  return result;
}

//Hàm ẩn danh(lambda)
// (var a, var b)=>{
//   return a+b;
// }

//Viết đầy đủ
double tinhtong(var a, double b, double c){
  return a+b+c;
}
//Sử dụng cú pháp rut gọn "=>"
double tinhtong1(var a, double b, double c) => a+b+c;


//Hàm main(): khởi đâu ứng dụng
void main(){
  print("hElLo");
  var x = tinhtong(1, 10, 100);
  print(x);

  var y = tinhtong1(1, 10, 100);
  print(y);
  
  var fn = createFullName(ho:"Lê",chuLot:"Văn",ten:"Chương");
   print(fn);

   var fn2 = createFullName(ho:"Lê",ten:"Chương",chuLot:"Văn");
   print(fn2);

    var fn3 = createFullName(ho:"Lê",ten:"Chương");
   print(fn3);

   print(sum(10));
   print(sum(10,1));
   print(sum(10,1,2));
   print(sum(10,1,2,3));

   var ham = (var a, var b){
    return a+b;
   };

   print(ham(1,2));

   var ham2 = (var a, var b)=>a+b;

   print(ham(1,2));
}