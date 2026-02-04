import 'dart:io';
void main() {
  print('Total Distance Traveled');
  stdout.write('ใส่ความเร็ว (กม./ชม.): ');
  double speed = double.parse(stdin.readLineSync()!);
  stdout.write('ใส่เวลาที่เดินทาง (ชม.): ');
  double time = double.parse(stdin.readLineSync()!);

  double distance = speed * time;
  print('ระยะทางรวมที่เดินทาง = $distance กม.');

}