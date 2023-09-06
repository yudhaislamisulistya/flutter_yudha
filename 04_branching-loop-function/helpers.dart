import 'dart:math';
import 'dart:typed_data';

// a function to generate an array of random numbers
// it accepts a min and max value, and size of the array, and returns an array of random numbers
List<int> generateArrayOfRandomNumbers(int min, int max, int size) {
  var arr = new Int64List(size);
  for (int i = 0; i < size; i++) {
    arr[i] = Random().nextInt(max - min) + min;
  }
  return arr;
}
