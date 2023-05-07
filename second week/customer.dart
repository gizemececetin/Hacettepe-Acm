///Customer için oluşturulan sınıf
class Customer {
  String name;
  int productCount;

  late final CustomerType type;

  ///Customer sınıfı için constructor methodu
  Customer(this.name, this.productCount) {
    if (productCount < 50) {
      type = CustomerType.Normal;
    } else {
      type = CustomerType.Premium;
    }
    /* 
    ///Kısa if kullanımı
    productCount < 50
        ? type = CustomerType.Normal
        : type = CustomerType.Premium; */
  }

  ///Customer adını ve parametre ile verilen soyadı değerini gösterir
  void showCustomer(String surname) {
    print("Customer Name: $name $surname");
  }

  ///Product sayısını döndürür
  int getProductCount() {
    return productCount;
  }

  ///Customer'ın type değerini gösterir
  void showCustomerLevel() {
    print("Customer Level: $type");
  }
}

///Customer tipi için oluşturulan enum
enum CustomerType { Normal, Premium }

///Premium olup olmadığını döndürmesi için yazılan extension
extension CustomerExtension on Customer {
  bool isPremium(type) {
    return this.type == CustomerType.Premium;
  }
}
