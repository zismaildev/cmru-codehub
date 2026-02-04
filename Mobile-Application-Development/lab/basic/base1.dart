main() {
  print("++ Hello, CMRU ++");

  // operators
  int x = 20, y = 30;
  print("x = $x, y = $y");
  print("x + y = ${x + y}");
  print("x - y = ${x - y}");
  print("x * y = ${x * y}");
  print("x / y = ${x / y}"); 
  print("x ~/ y = ${x ~/ y}"); // ผลลัพธ์เป็นจำนวนเต็ม
  print("x % y = ${x % y}"); // หารเอาเศ
  print("x += 5; x = ${x += 5}"); // x = x + 5
  print("y -= 10; y = ${y -= 10}"); // y = y - 10
  print("x == y: ${x == y}"); // เปรียบเทียบ
  print("x != y: ${x != y}"); // เปรียบเทียบ
  print("x > y: ${x > y}"); // เปรียบเทียบ
  print("x < y: ${x < y}"); // เปรียบเทียบ
  print("x >= y: ${x >= y}"); // เปรียบเทียบ
  print("x <= y: ${x <= y}"); // เปรียบเทียบ
  print("!(x < y): ${!(x < y)}"); // not
  print("(x < y) && (x != y): ${(x < y) && (x != y)}"); // and
  print("(x < y) || (x == y): ${(x < y) || (x == y)}"); // or
  print("(x < y) ^ (x == y): ${(x < y) ^ (x == y)}"); // xor
  print("(x < y) ^ (x != y): ${(x < y) ^ (x != y)}"); // xor

  // const and final variables
  // int x = 10000;
  // const int c1 = 10;
  // print("c1 = $c1");
  // const int c2 = 20;
  // print("c2 = $c2");
  // final int f1 = 30;
  // print("f1 = $f1");
  // final int f2 = x+40;
  // print("f2 = $f2");

  // var and dynamic variables
  // var v1 = 10;
  // var v2 = 'ten';
  // print("v1 = $v1, v2 = $v2");
  // var v3;
  // v3 = 100;
  // v3 = 'abc'; 
  // print("v3 = $v3");
  // dynamic d1 = 20;
  // print("d1 = $d1");
  // d1 = 'twenty';
  // print("d1 = $d1");

  // map variables
  // Map<String, String> capitals = new Map(); // Key: Value
  // capitals["Thailand"] = "Bangkok";
  // capitals['vietnam'] = "Hanoi";
  // print(capitals['Thailand']);
  // print(capitals['vietnam']);

  // list variables
  // List<String> provinces = ["Chiang Mai", "Lamphun", "Nan"];
  // print(provinces);
  // print(provinces[0]);
  // print(provinces[2]);
  // provinces.add("KamphaengPhet");
  // print(provinces[3]);
  // print(provinces);
  // provinces.removeAt(1);
  // print(provinces);
  // provinces.remove("KamphaengPhet");
  // print(provinces);
  // provinces.insert(1, "tak");
  // print(provinces);

  // boolean variables
  // bool bo1 = true;
  // print("bo1 = $bo1");
  // bool bo2 = false;
  // print("bo2 = $bo2");

  // string variables
  // String str1 = "Chiang Mai";
  // String str2 = "Lamphun";
  // print(str1 + str2);
  // String str3 = "Chiang Mai" 'Phayao';
  // print (str3);
  // print('$str1 $str2 $str3');


  // number variables
  // int num1;// 1num ไม่ถูกต้อง
  // print("num1 = $num1");
  // double num2 = 20.5;
  // print("num2 = ${num2}");
  // print("num1 + num2 = ${num1 + num2}");
  // print("num1 + num2 = ${num1+num2}");
  // num2 = num1 + num2;
  // print("num2 = ${num2}");

}