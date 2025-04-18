
typedef IntList = List<int>;

typedef ListMapper<X> = Map<X,List<X>>;
typedef StringList = List<String>;
void main() {
  IntList l1 = [1,2,3,4,5];
  print(l1);

  IntList l2 = [1,2,3,4,5,6,7];

  Map<String, List<String>> m1 = {};//Khắ dài
  ListMapper<String> m2 ={};//m1 và m2 cùng 1 kiểu

  StringList l3 =['C','H','U','O','N','G'];
  print(l3);
}