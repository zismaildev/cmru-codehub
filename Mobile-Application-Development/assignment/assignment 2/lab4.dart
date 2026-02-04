import 'dart:io';

void main() {
  print('โปรแกรมหาค่าสูงสุดและต่ำสุดจากตัวเลขจำนวนเต็ม 10 ตัว');

  int? max;
  int? min;
  
  for(int i = 1; i <= 10; i++) {
    stdout.write('ใส่ตัวเลขจำนวนเต็ม $i: ');
    int n = int.parse(stdin.readLineSync()!);

    if (max == null || n > max) {
      max = n;
    }
    if (min == null || n < min) {
      min = n;
    }
  }

  print('ค่ามากที่สุดคือ $max');
  print('ค่าน้อยที่สุดคือ $min');
}

