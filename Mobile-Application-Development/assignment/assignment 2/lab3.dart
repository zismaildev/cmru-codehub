import 'dart:io';

void main() {
  print('โปรแกรมตรวจสอบเลขที่เป็น 7 ในการวนรอบ');
  stdout.write('ใส่ตัวเลขที่ต้องการวนรอบ : ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    if (i % 7 == 0) {
      print(i);
    }
  }
}
