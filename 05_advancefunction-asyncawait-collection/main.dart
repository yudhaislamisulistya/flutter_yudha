import 'dart:math';

void main() async {
  // Anonymous Function
  // test(() => print("Hello "));

  // test(() {
  //   print("World");
  //   print("!");
  // });

  // var score = [80, 85, 75, 95, 90, 100];
  // score.sort((a, b) {
  //   switch (a - b) {
  //     case > 1:
  //       return 1;
  //     case < -1:
  //       return -1;
  //     default:
  //       return 0;
  //   }
  // });
  // print(score);

  // var name = ['G', 'C', 'B', 'D', 'A', 'M'];
  // name.sort((a, b) => b.compareTo(a));
  // print(name);

  // Async-Await
  // displayWord('Hello')
  //     .then((value) => print(value))
  //     .catchError((error) => print(error));
  // print('World');

  // print(await displayWord('Hello'));
  // print('World');

  // Collection
  // var setExample = {4, 5, 1, 2, 3, 1};
  // for (var i in setExample) {
  //   print(i);
  // }
  // setExample.forEach((element) {
  //   print(element);
  // });
  // print(setExample[0]);
  // List<int> listExample = [1];
  // listExample[0] = 2;
  // listExample.add(1);
  // listExample.addAll([1, 2, 3, 10000, -1]);
  // print(listExample);
  // listExample.sort((a, b) => b.compareTo(a));
  // print(listExample);

  // var recordExample = ('first', 1, 1.0);
  // print(recordExample);
  // print(recordExample.$1);

  // print(addAllNumbers(listExample));
  // print(listExample[0]);
  // listExample.forEach((element) {
  //   print(element);
  // });
  // var mapExample = {
  //   "name": "Ahmad",
  //   "age": 20,
  //   "gender": "Male",
  //   "address": "Jakarta"
  // };
  // mapExample.forEach((key, value) {
  //   print("${key}, ${value}");
  // });
  // print(mapExample);
  // print(mapExample['age']);
  // example: List of Map
  // List<Map<String, dynamic>> studentGrade = [
  //   {'study': 'Geography', 'score': 80},
  //   {'study': 'Math', 'score': 85},
  //   {'study': 'Physics', 'score': 75},
  //   {'study': 'Chemistry', 'score': 95},
  //   {'study': 'Biology', 'score': 90},
  //   {'study': 'Music', 'score': 100},
  // ];
  // print(studentGrade);
  // print(studentGrade[0]);
  // print(studentGrade[0]['study']);
  // print(studentGrade[0]['score']);

  // studentGrade.sort((a, b) => b['study'].compareTo(a['study']));
  // print(studentGrade);
}

Future<String> displayWord(String word) async {
  await Future.delayed(Duration(seconds: Random().nextInt(5)));
  return word;
}

void test(Function f) {
  f();
}

void hello() {
  print("Hello");
}

// add all number inside parameter using spread operator
int addAllNumbers(List<int> numbers) {
  int res = 0;
  for (int i = 0; i < numbers.length; i++) {
    res += numbers[i];
  }
  return res;
}
