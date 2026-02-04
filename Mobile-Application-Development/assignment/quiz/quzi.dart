import 'dart:io';

void main() {
  print('Shop Promotion Buy 2 Get 1');

  List<int> codes = [];
  List<int> prices = [];

  // use for loop to get fixed 3 items
  // for (int i = 0; i < 3; i++) {
  //   stdout.write('Enter Code Item ${i + 1}: ');
  //   int code = int.parse(stdin.readLineSync()!);

  //   stdout.write('Enter Price Item ${i + 1}: ');
  //   int price = int.parse(stdin.readLineSync()!);

  //   codes.add(code);
  //   prices.add(price);
  // }

  while (true) {
    stdout.write('Enter Code Item ${codes.length + 1} (-1 to stop): ');
    int code = int.parse(stdin.readLineSync()!);

    if (code == -1) {
      break;
    }

    stdout.write('Enter Price Item ${codes.length + 1}: ');
    int price = int.parse(stdin.readLineSync()!);

    codes.add(code);
    prices.add(price);
  }

  if (prices.length < 3) {
    print('Promotion requires at least 3 items.');
    return;
  }

  int totalPrice = 0;
  for (int price in prices) {
    totalPrice += price;
  }

  int minPrice = prices[0];
  int minIndex = 0;

  for (int i = 1; i < prices.length; i++) {
    if (prices[i] < minPrice) {
      minPrice = prices[i];
      minIndex = i;
    }
  }

  int finalPrice = totalPrice - minPrice;

  print('-------------------------');
  print('Total Price: $totalPrice');
  print('Free Item Code: ${codes[minIndex]}');
  print('Free Item Price: $minPrice');
  print('Final Price After Discount: $finalPrice');
}
