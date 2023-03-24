// ignore_for_file: prefer_conditional_assignment

import '../factory_method/product_interface.dart';

// In this example, the ProductCatalog class has a private constructor to prevent other classes from creating instances.
//The instance getter method provides access to the singleton instance of the class, creating it if it doesn't exist yet.
//Finally, the products property is an example of a class property that can be accessed from anywhere in the application once the singleton instance is created.
class ProductCatalog {
  static ProductCatalog? _instance;

  // Private constructor to prevent other classes from creating instances
  ProductCatalog._();

  static ProductCatalog? get instance {
    if (_instance == null) {
      _instance = ProductCatalog._();
    }
    return _instance;
  }

  // Add methods and properties here as needed
  List<Product> products = [];
}
