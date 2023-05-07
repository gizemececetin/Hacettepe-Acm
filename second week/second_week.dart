import 'customer.dart';

void main(List<String> args) {
  checkNullVariables();

  ///Customer nesnesi
  Customer customer = Customer("Gizem", 60);
  print("Customer name: ${customer.name}");
  print("Customer product count: ${customer.productCount}");

  ///Customer sınıfının methodları
  customer.showCustomer("Çetin");
  customer.showCustomerLevel();
  customer.getProductCount();

  ///2. customer nesnesi
  Customer customer2 = Customer("Said", 40);
  print("Customer name: ${customer2.name}");
  
  customer2.showCustomer("Korkmaz");
  customer2.showCustomerLevel();

  ///Customer nesnesinin premium özellliğini kontrol etme
  if (customer.type == "Premium") {
    print("You are a premium customer");
  } else {
    print("You need to buy more product");
  }
  ///Customer nesnesinin premium özellliğini enum olarak tanımlanan
  ///type değişkeni ile kontrol etme
  switch (customer.type) {
    case CustomerType.Premium:
      print("You are a premium customer");
      break;
    case CustomerType.Normal:
      print("You need to buy more product");
      break;
    default:
  }

  ///Customer için yazılan extension kullanımı
  if (customer.isPremium(customer.type)) {
    print("You are a premium customer");
  }
}

///Null safety anlatırken yapılan işlemlerin olduğu method
void checkNullVariables() {
  ///Bir değer atanmadığı için null
  int nullValue;

  ///Null olabilecek değişkenleri bu şekilde kullanıyoruz
  String? nullableValue;

  if (nullableValue == "Flutter") {}

  ///Const ve Final değiştirilemez değerlerdir
  ///Temel amacı belleği verimli kullanmak

  ///Final runtime daki son değeri alır.
  final int passingGrade = 50;

  ///Const proje ilk çalıştığı anda atanır.
  const int maxGrade = 100;

  int? examGrade;

  ///Null check
  if (examGrade != null) {
    if ((examGrade) < 50) {
      print("You failed!");
    } else {
      print("You passed!");
    }
  } else {
    examGrade = 0;
  }

  ///Null check bu şekilde de yapılabilir
  if ((examGrade ?? 0) < 50) {}

  ///Başta nullable olarak tanımladığımız değişkenin
  ///artık null olmadığından emin olduğumuzda bu şekilde kullanabiliriz.
  isPassed(examGrade!);
}

///Öğrencinin dersi geçip geçmediğini döndürür
bool isPassed(int grade) {
  return grade >= 50;
}
