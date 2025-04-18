import 'dart:async';

/*


*/

Future<String> layten() async{
  return "Le Van C";
}

//Ham tra ve future
Future<String> taiDuLieu(){
  return Future.delayed(
    Duration(seconds: 2),
    () => "Dữ liệu đã tải xong"
    );
}


//gọi hàm cách 1
void hamchinh(){
  print("Bắt đàu tải");
  Future<String> f = taiDuLieu();
  f.then((ketQua){
    print("Kết quả: $ketQua");
  });
  print("Tiếp tục công việc khác.");
}

void hamchinh2() async{
  print("Bắt đàu tải");
  String ketQua = await taiDuLieu();
  print("Kết quả: $ketQua");
  print("Tiếp tục công việc khác.");
}

void main(){
  hamchinh2();
}