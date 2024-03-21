import 'dart:io';

// Interface
abstract class Animal {
  void makeSound();
}

// Base class
class LivingBeing {
  void breathe() {
    print('Breathing...');
  }
}

// Derived class with inheritance
class Dog extends LivingBeing implements Animal {
  @override
  void makeSound() {
    print('Woof!');
  }

  // Overriding a method
  @override
  void breathe() {
    super.breathe(); // Call the base class method
    print('Dog is breathing...');
  }
}

void main() {
  // Creating an instance of Dog
  var myDog = Dog();

  // Initializing data from a file
  initializeFromFile(myDog);

  // Demonstrating the use of a loop
  for (int i = 0; i < 3; i++) {
    myDog.makeSound();
  }

  // Call the overridden method
  myDog.breathe();
}

// Method to initialize data from a file
void initializeFromFile(Dog dog) {
  File file = File('dog_data.txt');
  List<String> lines = file.readAsLinesSync();

  // Assuming the first line contains the name of the dog
  if (lines.isNotEmpty) {
    dog.name = lines[0];
  }
}

// Extension to add a property to Dog class
extension DogNameExtension on Dog {
  // Getter
  String get name => _name;

  // Setter
  set name(String value) {
    _name = value;
  }
}

// Private field for the Dog's name
String _name = 'Unnamed'; // Default name
