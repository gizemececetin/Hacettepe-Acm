void main(List<String> args) {
  ///String
  print("Hello");

  String name = "Gizem";
  print(name);

  print("Hello" + " " + "Gizem");
  print("Hello" + " " + name);

  ///int
  int number = 1;
  print(number);

  print("Hello $number");
  print("Hello ${number.toString()}");
  print("Hello" + number.toString());

  ///double
  double money = 2.5;

  /// if else
  if (money < 2.5) {
    print("Paranız 2.5 tan az");
  } else if (money > 2.5) {
    print("Paranız 2.5 tan fazla");
  } else if (money > 2.5) {
    print("Paranız 2.5 tan fazla");
  } else {
    print("Paranız 2.5");
  }

  if (money == 2.5) {
    print("Paranız 2.5");
  } else if (money == 2.5) {
    print("Paranız 2.5 ");
  }

  print(money);

  ///boolean
  bool condition = true;
  print(condition);

  if (condition) {
    print("Doğru");
  } else {
    print("Yanlış");
  }

  ///var
  var unknown = "Gizem";
  print(unknown);

  ///dynamic
  dynamic unknownDynamic = "Gizem";
  print(unknownDynamic);
  unknownDynamic = 1;

  print(unknownDynamic);

  int caseNumber = 1;
  switch (caseNumber) {
    case 0:
      print("Case 0");
      break;

    case 1:
      print("Case 1");
      break;

    default:
      print("Default case");
  }

  ///List
  List userList = ["Gizem", "Ece", "Çetin"];

  print(userList.removeAt(userList.length - 1));

  userList[1] = "Flutter";
  print(userList);

  userList.clear();

  List<String> stringList = ["Gizem", "Ece"];
  List<int> numList = [25, 13];

  ///Map
  Map userMap = {"name": "Gizem", "age": 25};
  print(userMap);

  print(userMap["name"]);
  print(userMap["age"]);
  Map<String, String> stringMap = {"name": "Gizem", "age": "25^#"};
  Map<String, dynamic> dynamicMap = {"name": "Gizem", "age": 25};

  ///For
  for (String name in userList) {
    print("Hello $name");
  }

  for (int i = 0; i <= 10; i++) {
    print("Sayı: $i");
  }

  ///While
  int count = 0;
  while (count <= 10) {
    print("Count: $count");
    count = count + 1;
  }

  ///Functions
  print("Hello ${userList[0]}");
  print("Hello ${userList[1]}");

  showUserName(userList[0]);
  showUserName(userList[1]);
  showUserName(userList[2]);

  for (int i = 0; i < userList.length; i++) {
    showUserName(userList[i]);
  }

  int currentBalance = 100;
  print("Mevcut bakiye: $currentBalance");
  addBalance(currentBalance, 200);

  String bakiye = showBalance(currentBalance);
  print("Bakiye:" + bakiye);
}

///Kullanıcının ismini gösterir
void showUserName(String name) {
  print("Hello $name");
}

///Bakiye ekler ve gösterir
void addBalance(int x, int y) {
  int toplam = x + y;
  print("Toplam bakiye: $toplam");
}

///Bakiyeyi stringe çevirerek döndürür
String showBalance(int bakiye) {
  return bakiye.toString();
}
