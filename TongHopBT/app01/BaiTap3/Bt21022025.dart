/*
BÀI TẬP: Cấu trúc dữ liệu trong Dart
====================================
Bài 1: List
 
Có bao nhiêu cách để khai báo một List trong đoạn code? Liệt kê và giải thích từng cách.

Cho List ['A', 'B', 'C']. Viết code để:
 
Thêm phần tử 'D' vào cuối List
Chèn phần tử 'X' vào vị trí thứ 1
Xóa phần tử 'B'
In ra độ dài của List
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar list = [1, 2, 3, 4, 5];
list.removeWhere((e) => e % 2 == 0);
print(list);
 
Giải thích sự khác nhau giữa các phương thức:
 
remove() và removeAt()
add() và insert()
addAll() và insertAll()
 
 */
//Bài 1 
import 'dart:ffi';

void bai1(){

//Có 4 cách: 
  List<String> list1 = ['A', 'B', 'C']; // Trực tiếp
  var list2 = [1,2,3]; // sử dụng var
  List<String> list3 = []; // list rỗng
  var list4 = List<int>.filled(3,0); // List có kích thước cố định [0,0,0]

  list1.add('D'); //Thêm phần tử 'D' vào cuối List
  print(list1);
  list1.insert(1,'X');//Chèn phần tử 'X' vào vị trí thứ 1
  print(list1);
  list1.remove('B');//Xóa phần tử 'B'
  print(list1);
  print(list1.length);// In ra độ dài của List

  //Đoạn code sau sẽ cho kết quả gì? [1,3,5];
  

  //remove() Xóa phần tử có giá trị chỉ định; removeAt() Xóa phần tử tại vị trí chỉ định
  //add() Thêm 1 phần tử chỉ định và insert() Chèn 1 phần tử chỉ định
  //addAll() Thêm nhiều phần tử chỉ định và insertAll() Chèn nhiều phần tử chỉ định
}
/*
====================================
Bài 2: Set
 
Set khác List ở những điểm nào? Nêu ít nhất 3 điểm khác biệt.
Cho hai Set:
 
dartCopyvar set1 = {1, 2, 3};
var set2 = {3, 4, 5};
Tính kết quả của:
 
Union (hợp)
Intersection (giao)
Difference (hiệu) của set1 với set2
 
 
Đoạn code sau sẽ cho kết quả gì?
 
dartCopyvar mySet = Set.from([1, 2, 2, 3, 3, 4]);
print(mySet.length);
*/
//Bài 2 
 void bai2(){

  // list
  // - List là tập hợp các phần tử có thứ tự và có thể trùng lặp
  // - Các phần tử được truy cập bằng chỉ số (index) từ 0
  // - Kích thước có thể thay đổi được

  // Set
  // - Set là tập hợp các phần tử không trùng lặp
  // - Không có thứ tự xác định
  // - Mỗi phần tử chỉ xuất hiện một lần

  Set<int> set1 = {1, 2, 3};
  var set2 = {3, 4, 5};

  var union = set1.union(set2);        // Hợp
  print(union);
  var intersection = set1.intersection(set2); // Giao
  print(intersection);
  var difference = set1.difference(set2);    // Hiệu
  print(difference);

  //Đoạn code sau sẽ cho kết quả: [1,3,5];
  

  //remove() Xóa phần tử có giá trị chỉ định; removeAt() Xóa phần tử tại vị trí chỉ định
  //add() Thêm 1 phần tử chỉ định và insert() Chèn 1 phần tử chỉ định
  //addAll() Thêm nhiều phần tử chỉ định và insertAll() Chèn nhiều phần tử chỉ định
}
/*
====================================
Bài 3: Map
 
Viết code để thực hiện các yêu cầu sau với Map:
 
dartCopyMap<String, dynamic> user = {
  'name': 'Nam',
  'age': 20,
  'isStudent': true
};
 
Thêm email: 'nam@gmail.com'
Cập nhật age thành 21
Xóa trường isStudent
Kiểm tra xem Map có chứa key 'phone' không
 
 
So sánh hai cách truy cập giá trị trong Map:
 
dartCopyuser['phone']
user['phone'] ?? 'Không có số điện thoại'
 
Viết một hàm nhận vào một Map và in ra tất cả các cặp key-value, mỗi cặp trên một dòng.
 
 */

void bai3() {
  Map<String, dynamic> user = {
    'name': 'Nam',
    'age': 20,
    'isStudent': true
  };

  user['email'] = 'nam@gmail.com';
  
  user['age'] = 21;
  
  user.remove('isStudent');
  
  bool hasPhone = user.containsKey('phone');
  print('Map có chứa key "phone": $hasPhone');

  print('Cách 1: ${user['phone']}');
  print('Cách 2: ${user['phone'] ?? 'Không có số điện thoại'}');

  // Gọi hàm in ra các cặp key-value
  printKeyValuePairs(user);
}

// Hàm nhận vào một Map và in ra tất cả các cặp key-value
void printKeyValuePairs(Map<String, dynamic> map) {
  map.forEach((key, value) {
    print('$key: $value');
  });
}

/* 
====================================
Phần 4: Runes
 
Runes được sử dụng để làm gì? Cho ví dụ cụ thể.
Viết code để:
 
 
Tạo một Runes chứa ký tự emoji cười 😀
Chuyển đổi Runes đó thành String
In ra số lượng điểm mã của Runes
 
*/
void bai4 () {
  Runes runes = Runes('\u{1f600}'); // Ký tự mặt cười
  String emojiStr = String.fromCharCodes(runes); // Chuyển đổi Runes thành String
  print(emojiStr); // In emoji cười
  print('Số lượng điểm mã của runes: ${runes.length}');
}

void main(){

}