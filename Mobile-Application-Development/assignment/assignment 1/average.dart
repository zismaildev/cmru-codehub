import 'dart:io';
void main() {
  print('Average of Three Numbers');
  stdout.write('ใส่ตัวเลขตัวที่ 1: ');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.write('ใส่ตัวเลขตัวที่ 2: ');
  int num2 = int.parse(stdin.readLineSync()!);
  stdout.write('ใส่ตัวเลขตัวที่ 3: ');
  int num3 = int.parse(stdin.readLineSync()!);
  double average = (num1 + num2 + num3) / 3;
  print('ค่าเฉลี่ย = $average');
}