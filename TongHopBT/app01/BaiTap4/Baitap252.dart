int calculateSum(int a, int b) => a+b;
void main(){
  //Viết 1 đoạn mã dart để khai báo các kiểu dữ liệu khác nhau như số nguyên, số thực, chuỗi ký tự và boolen. sau đó, in giá trị của các biến này ra console để xem kết quả.
  int sN = 2;
  double sT = 2.2;
  String cKT = "Lê Văn Chương";
  bool dung = true;

  print("Số nguyên: $sN");
  print("Số thực: $sT");
  print("Chuỗi ký tự: $cKT");
  print("Boolean: $dung");

  //Viết 1 hàm trong dart tên calculateSum nhận vào 2 tham số nguyên và trả về tổng của chúng. Gọi hàm này trong chương trình và in ra kết quả
  print(calculateSum(3,8));
}