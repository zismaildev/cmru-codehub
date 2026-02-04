void main() {
  print("... Start Program ...");


  // แบบ for
  // for (int i = 1; i<=10; i++) {
  //   if(i == 6) continue; // ข้ามรอบที่ 6
  //   if(i == 12) break;   // ออกจากลูปเมื่อ i = 12
  //   print('Loop for : $i');
  // }

  var datas = [1,3,4,10,8,6];
  for (int item in datas) {
    print('Data item = $item');
  } 
  
  // แบบ while
  // int controlLopp = 3;
  // while (controlLopp < 7) {
  //   print("Loop = $controlLopp");
  //   controlLopp += 2;
  // }

  // แบบ do while
  // controlLopp = 10;
  // do {
  //   print("Do Loop = $controlLopp");
  //   controlLopp += 2;
  // } while (controlLopp < 10);


  // แบบ switch case
  // int num1 = 10;
  // switch (num1) {
  //   case 1:
  //     print('one');
  //     break;
  //   case 2:
  //     print('two');
  //     break;
  //   case 10:
  //     print('ten');
  //     break;
  //   case 5:
  //     print('five');
  //     break;
  //   case 20:
  //     print('twenty');
  //     break;
  //   default:
  //     print('+++ unknown +++');
  // }

  // แบบ if else
  // int num1 = 10;
  // if (num1 > 10) {
  //   print("Chiangmai");
  // } else if (num1 < 10) {
  //   print("Lamphun");
  // } else {
  //   print("Nan");
  // }
  print("... End Program ...");
}
