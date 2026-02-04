import 'dart:io';

void main() {
  print('โปรแกรมตรวจสอบเลขคู่ในการวนรอบ');
  stdout.write('ใส่ตัวเลขที่ต้องการวนรอบ : ');
  int n = int.parse(stdin.readLineSync()!);

  for(int i = 1; i <= n; i++) {
    print('รอบที่ $i');
  }
}
