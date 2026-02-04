import 'dart:io';

void main() {
  print('program');

  List<int> numbers = [];

  for (int i = 1; i <= 10; i++) {
    stdout.write('ใส่ตัวเลขจำนวนเต็ม $i: ');
    int n = int.parse(stdin.readLineSync()!);
    numbers.add(n);
  }

  numbers.sort((b, a) => a.compareTo(b));

  print('ตัวเลขที่เรียงจากน้อยไปมาก: $numbers');
}
