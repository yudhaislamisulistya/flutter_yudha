void main() {
  // LOOPING
  // 1) loop an array
  // var score = [80, 85, 75, 90, 95, 100];
  // for (int i = 0; i < score.length; i++) {
  //   var current_score = score[i];
  //   if (current_score % 2 == 0) {
  //     print('score genap: $current_score');
  //   } else if (current_score > 90) {
  //     print('score diatas 90: $current_score');
  //   } else if (current_score < 85) {
  //     print('score dibawah 85: $current_score');
  //     break;
  //   } else {
  //     print('score ganjil: $current_score');
  //   }
  // }
  // 2) nested loop
  // var current_number = 1;
  // for (int i = 0; i < 3; i++) {
  //   for (int j = 0; j < 10; j++) {
  //     stdout.write(current_number);
  //     stdout.write(' ');
  //     current_number++;
  //   }
  //   stdout.write('\n');
  // }
  // 3) while
  // int current_number = 1;
  // while (current_number != 5) {
  //   stdout.write(current_number);
  //   stdout.write(' ');
  //   current_number = Random().nextInt(10);
  // }
  // stdout.write('\n');
  // 4) do-while
  // int current_number = 5;
  // do {
  //   stdout.write(current_number);
  //   stdout.write(' ');
  //   current_number = Random().nextInt(10);
  // } while (current_number != 5);
  // stdout.write('\n');

  // BRANCHING
  // 1) if, else-if, else
  // List<int> score = [90, 65, 55, 85, 100];
  // int min = score[0];
  // int max = score[0];
  // for (int i = 1; i < score.length; i++) {
  //   if (score[i] < min) {
  //     min = score[i];
  //   } else if (score[i] > max) {
  //     max = score[i];
  //   }
  // }
  // print('min: $min, max: $max');
  // 2) switch
  // var current_date = DateTime.now();
  // switch (current_date.weekday) {
  //   case 1:
  //     print('Monday');
  //     break;
  //   case 2:
  //     print('Tuesday');
  //     break;
  //   case 3:
  //     print('Wednesday');
  //     break;
  //   case 4:
  //     print('Thursday');
  //     break;
  //   case 5:
  //     print('Friday');
  //     break;
  //   case 6:
  //     print('Saturday');
  //     break;
  //   case 7:
  //     print('Sunday');
  //     break;
  //   default:
  //     print('Invalid weekday');
  // }
  // 3) branching in nested loop
  // var current_number = 1;
  // for (int i = 0; i < 3; i++) {
  //   for (int j = 0; j < 10;) {
  //     if (current_number % 2 != 0) {
  //       stdout.write(current_number);
  //       stdout.write('\t');
  //       j++;
  //     }
  //     current_number++;
  //   }
  //   stdout.write('\n');
  // }

  // function
  // print(generateArrayOfRandomNumbers(10, 50, 5));
}
