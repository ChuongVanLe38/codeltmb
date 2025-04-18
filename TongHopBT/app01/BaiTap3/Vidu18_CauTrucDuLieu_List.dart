void main(){
  //Định nghĩa
  //Có thể trùng lặp

  List<String> list1 = ['A','B','C']; //tRỰC TIẾP
  var list2 = [1,2,3];
  List<String> list3 = [];//list trống
  var list4 = List<int>.filled(3,0);//list có kích thước cố định
  print(list4);

  //1. Thêm phần tử
  list1.add('D'); // thêm 1 phần tử
  list1.addAll(['A','C']);// thêm nhiều phần tử, cho phép trùng lặp
  list1.insert(0,'Z');//Chèn 1 phần tử
  list1.insertAll(1,['1', '0']);//Chèn nhiều phần tử
  print(list1);

  //2.Xóa phần tử bên trong list
  list1.remove('A');//xÓA PHẦN TỬ CÓ GIÁ TRỊ A
  list1.removeAt(0);//Xóa phần tử tại vị trí 0
  list1.removeLast;//Xóa phần tử tại vị trí cuối
  list1.removeWhere((e)=>e=='B');//Xóa theo điều kiện
  list1.clear();
  print(list1);

  //3. Truy cập phần tử:
  print(list2[0]); // Lấy phần tử tại vị trí 0;
  print(list2.first);// Lấy phần tử tại vị trí đàu tiên;
  print(list2.last);// Lấy phần tử tại vị trí cuối cùng;
  print(list2.length);// độ dài list;

  //4. Kiểm tra
  print(list2.isEmpty); //kiểm tra rỗng
  print('List 3: ${list3.isNotEmpty?'Không rỗng':'rỗng'}');
  print(list4.contains(1));//Có số 1 trong list không?
  print(list4.contains(0));//Có số 0 trong list không?
  print(list4.indexOf(0));//vị trí đầu tiên xuất hiện số 0
  print(list4.lastIndexOf(0));//vị trí cuối cùng xuất hiện số 0

  //5. Biến đổi
  list4 = [2,1,3,9,0,10];
  print(list4);
  list4.sort();//Xếp tăng dần
  print(list4);
  list4.reversed;//Đảo ngược
  print(list4.reversed);//Đảo ngược
  list4=list4.reversed.toList();//List đảo ngược
  print(list4);


  //6.Cắt và nối
  var subList = list4.sublist(1,3);//Cắt 1 sublist từ vị trí 1 đến vị trí bé hơn 3
  print(subList);
  var str_joined = list4.join(",");
  print((str_joined));

  //7.Duyệt các phần tử bên trong list
  list4.forEach((element){
    print(element);
  });//In những giá trị bằng vòng lặp

  
  }