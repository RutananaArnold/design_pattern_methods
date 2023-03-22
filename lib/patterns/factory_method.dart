// This code represents an implementation of the Factory Method design pattern in object-oriented programming. The Factory Method pattern is a creational pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.

// In this code, there is an abstract class Product that defines a display() method. There are three concrete classes that implement Product: Electronics, Clothing, and Groceries. Each of these classes overrides the display() method to provide a specific implementation for that type of product.

// There is also an abstract class ProductFactory that defines a createProduct() method, which returns an instance of Product. This is the factory method that subclasses will implement to create different types of products.

// There are three concrete classes that implement ProductFactory: ElectronicsFactory, ClothingFactory, and GroceriesFactory. Each of these classes overrides the createProduct() method to return an instance of the corresponding Product subclass.

// In the main() function, instances of the ProductFactory subclasses are created and used to create instances of the corresponding Product subclasses. The display() method is then called on each Product instance to demonstrate the different implementations provided by each type of product.

// Overall, the Factory Method pattern allows for flexible and extensible object creation, as new types of products can be added by simply creating a new Product subclass and a corresponding ProductFactory subclass. This can be particularly useful in situations where object creation is complex or varies depending on runtime conditions.

abstract class Product {
  void display();
}

class Electronics implements Product {
  @override
  void display() {
    print("This is an electronics product");
  }
}

class Clothing implements Product {
  @override
  void display() {
    print("This is a clothing product");
  }
}

class Groceries implements Product {
  @override
  void display() {
    print("This is a groceries product");
  }
}

abstract class ProductFactory {
  Product createProduct();
}

class ElectronicsFactory implements ProductFactory {
  @override
  Product createProduct() {
    return Electronics();
  }
}

class ClothingFactory implements ProductFactory {
  @override
  Product createProduct() {
    return Clothing();
  }
}

class GroceriesFactory implements ProductFactory {
  @override
  Product createProduct() {
    return Groceries();
  }
}

void main() {
  ProductFactory factory = ElectronicsFactory();
  Product product = factory.createProduct();
  product.display();

  factory = ClothingFactory();
  product = factory.createProduct();
  product.display();

  factory = GroceriesFactory();
  product = factory.createProduct();
  product.display();
}
