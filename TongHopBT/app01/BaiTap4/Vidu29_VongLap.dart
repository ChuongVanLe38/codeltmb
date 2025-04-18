void main(){
  //vòng lập for
  for(var i=1;i<=5;i++){
    print(i);
  }

  //Iterable: List, Set
  //for in
  var names = ["Lê","Văn","Chương"];
  for (var name in names){
    print(name);
  }

  //vòng lặp white
  var i =1;
  while(i<5){
    print(i);
    i++;
  }

  //vòng lặp do-while(thực hiện ít nhất 1 lằn)
  var x=1;
  do{
    print(x);
    x++;
  }while(x<=5);

  x=1;
  do{
    print(x);
    x++;
    if(x==3) break;
  }while(x<=5);

  //continue
  print("-------");
   x=0;
  do{
    x++;
    if(x==3) continue;
    print(x);
    x++;
  }while(x<=5);
  print("-------");
}