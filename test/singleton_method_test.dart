import 'package:design_pattern_methods/patterns/factory_method/product_interface.dart';
import 'package:design_pattern_methods/patterns/singleton_method/singleton.dart';
import 'package:flutter_test/flutter_test.dart';
// In this unit test, We first test that the ProductCatalog instance is a singleton by creating two instances and checking that they are equal using the expect method.

// We then test that the products property of the ProductCatalog class is initially empty by using the isEmpty matcher. 
//Finally, we test that we can add products to the ProductCatalog instance by creating two Product objects, 
//adding them to the products list using the add method, 
//and then checking that the products list contains both products using the containsAll matcher.


void main() {
  test('ProductCatalog instance should be a singleton', () {
    ProductCatalog? catalog1 = ProductCatalog.instance;
    ProductCatalog? catalog2 = ProductCatalog.instance;

    expect(catalog1, equals(catalog2));
  });

  test('ProductCatalog should have an empty product list by default', () {
    ProductCatalog? catalog = ProductCatalog.instance;

    expect(catalog?.products, isEmpty);
  });

  test('ProductCatalog should be able to add products', () {
    ProductCatalog? catalog = ProductCatalog.instance;
    Product product1 = Product(
      name: "Product A",
      price: 100,
      category: 'clothing',
    );
    Product product2 = Product(
      name: "Product B",
      price: 200,
      category: 'electronics',
    );

    catalog!.products.add(product1);
    catalog.products.add(product2);

    expect(catalog.products, containsAll([product1, product2]));
  });
}
