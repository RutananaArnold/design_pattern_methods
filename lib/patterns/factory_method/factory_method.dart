// This code represents an implementation of the Factory Method design pattern in object-oriented programming. The Factory Method pattern is a creational pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

// In this code, there is an interface class Product that defines properties name, price and category.
//There are three concrete classes that implement Product: Electronics, Clothing, and Groceries.
//Each of these classes overrides the properties name, price and category, to provide a specific implementation for that type of product.

// There is also an interface class ProductFactory that defines a createProduct() method, which returns an instance of Product.
//This createProduct() method takes in 2 parameters i.e type which is a String specifying a product category and pdt which is an instance of Product(). this function checks to confirm which category does the product belong to,
//upon confirmation, the product is added to our data store and the method return an instance of that Product Catgory.

// Overall, the Factory Method pattern allows for flexible and extensible object creation, as new types of products can be added by simply creating a new Product subclass and a corresponding ProductFactory subclass. This can be particularly useful in situations where object creation is complex or varies depending on runtime conditions.

import 'package:design_pattern_methods/patterns/factory_method/product_interface.dart';

// concrete class
class Electronics implements Product {
  @override
  String name;
  @override
  String category;
  @override
  int price;
  Electronics(
      {required this.name, required this.category, required this.price});
}

// concrete class
class Clothing implements Product {
  @override
  String name;
  @override
  String category;
  @override
  int price;
  Clothing({required this.name, required this.category, required this.price});
}

// concrete class
class Groceries implements Product {
  @override
  String name;
  @override
  String category;
  @override
  int price;
  Groceries({required this.name, required this.category, required this.price});
}

class ProductFactory {
  Product createProduct(String type, Product pdt) {
    if (type == "clothing") {
      allProducts.add(pdt);
      return Clothing(name: pdt.name, category: pdt.category, price: pdt.price);
    } else if (type == "groceries") {
      allProducts.add(pdt);
      return Groceries(
          name: pdt.name, category: pdt.category, price: pdt.price);
    } else {
      allProducts.add(pdt);
      return Electronics(
          name: pdt.name, category: pdt.category, price: pdt.price);
    }
  }
}
