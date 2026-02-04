import 'dart:io';

void main() {
  print('Volume of cylinder');
  stdout.write('ใส่รัศมี: ');
  double radius = double.parse(stdin.readLineSync()!);
  stdout.write('ใส่ความสูง: ');
  double height = double.parse(stdin.readLineSync()!);
  double area = 3.14159 * radius * radius;
  double volume = area * height;
  print('ปริมาตรทรงกระบอก = ${volume.toStringAsFixed(2)}');
}