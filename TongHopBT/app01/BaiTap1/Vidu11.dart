void main(){
  int toan =8;
  int van = 7;
  int Tong = 0;
  //Cộng điểm từng môn
  Tong += toan;
  Tong += van;
  //Tinh diem trung binh
  double diemTB= Tong/2;
  //gắn điểm dạt/không đạt
  String? ketQua;
  ketQua ??='chua xet';

  if(diemTB >=5){
    ketQua='Dat';
  }

  print('Diem TB: $diemTB');
  print('Ket qua: $ketQua');
}